package servlet;

import java.io.IOException;
import java.time.DateTimeException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.CartBean;
import bean.CustomerBean;
import dao.DAOException;
import dao.OrderDAO;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストの文字コードを設定
		request.setCharacterEncoding("utf-8");

		// セッションからカートを取得
		HttpSession session = request.getSession(false);	// すでにセッションに登録されている属性を取得するので引数はfalse

		// セッションがない場合：不正なアクセスが含まれている場合もあるのでエラーページに強制的に遷移
		if (session == null) {
			request.setAttribute("message", "セッションが切れています。もう一度トップページより操作してください。");
			this.gotoPage(request, response, "errInternal.jsp");
			return;
		}

		// カートがない場合：不正アクセスである可能性があるのでエラーページに強制的に遷移
		CartBean cart = (CartBean) session.getAttribute("cart");
		if (cart == null) {
			request.setAttribute("message", "正しく操作してください。");
			this.gotoPage(request, response, "errInternal.jsp");
			return;
		}

		// リクエストパラメータの取得
		String action = request.getParameter("action");

		// actionキーが「input_customer」またはパラメータが存在しない場合：お客様情報入力画面に遷移
		if (action == null || action.length() == 0 || action.equals("input_customer")) {
			this.gotoPage(request, response, "customerInfo.jsp");

		// actionキーが「confirm」の場合：入力情報確認画面に遷移
		} else if (action.equals("confirm")) {
			request.setCharacterEncoding("utf-8");
			// リクエストパラメータの取得
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String tel = request.getParameter("tel");
			String email = request.getParameter("email");
			//追加内容のリクエストパラメータの取得
			String yearString = request.getParameter("year");
			String monthString = request.getParameter("month");
			String dateString = request.getParameter("date");

			//パラメータチェック
			if (yearString == null || yearString.length() == 0 ||monthString == null
					|| monthString.length() == 0 || dateString == null || dateString.length() == 0) {
					request.setAttribute("message", "配送日が未入力です");
					gotoPage(request, response, "/errInternal.jsp");
					return;
			}

			int year = 0;
			int month = 0;
			int date = 0;
			try {
				year = Integer.parseInt(yearString);
				month = Integer.parseInt(monthString);
				date = Integer.parseInt(dateString);
			}catch (NumberFormatException e) {
				request.setAttribute("message", "整数を入力してください");
				gotoPage(request, response, "/errInternal.jsp");
				return;
			}

			CustomerBean customer = new CustomerBean();
			customer.setName(name);
			customer.setAddress(address);
			customer.setTel(tel);
			customer.setEmail(email);
			customer.setYear(year);
			customer.setMonth(month);
			customer.setDate(date);

			//当日の情報を取得する
			try {
				LocalDate today = LocalDate.now();

				LocalDate calcDeliveryDate = LocalDate.of(customer.getYear(), customer.getMonth(), customer.getDate());

				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");

				int todayInt = Integer.parseInt(today.format(formatter));
				int calcDeliveryDateInt = Integer.parseInt(calcDeliveryDate.format(formatter));

				//０より小さい整数、8~69の間、76より大きい数はエラーの表示
				if ( (calcDeliveryDateInt - todayInt) < 0 ||
					 ((calcDeliveryDateInt - todayInt) >= 8  && (calcDeliveryDateInt - todayInt) <= 69)
					 || (calcDeliveryDateInt - todayInt) > 76) {

					request.setAttribute("message", "1週間以内にしてください");
					gotoPage(request, response, "/errInternal.jsp");
					return;
					}
			}catch(DateTimeException e) {
				e.printStackTrace();
				request.setAttribute("message", "そのような年月日はありません");
				gotoPage(request, response, "/errInternal.jsp");
				return;
			}



			// セッションスコープに顧客情報を登録
			session.setAttribute("customer", customer);
			// 確認画面に遷移
			this.gotoPage(request, response, "/confirm.jsp");

		// actionキーが「order」の場合：完了画面に遷移
		} else if (action.equals("order")) {
			// 顧客情報を取得
			CustomerBean customer = (CustomerBean) session.getAttribute("customer");
			// 顧客情報がない場合：：不正アクセスである可能性があるのでエラーページに強制的に遷移
			if (customer == null) {
				request.setAttribute("message", "正しく操作してください。");
				this.gotoPage(request, response, "/errInternal.jsp");
				return;
			}

			try {
				// 注文を確定
				OrderDAO dao = new OrderDAO();
				int orderNumber = dao.saveOrder(customer, cart);
				String deliveryDate = dao.getDeliveryDate();
				// リクエストスコープに注文番号を登録
				request.setAttribute("orderNumber", orderNumber);
				request.setAttribute("deliveryDate", deliveryDate);

				// 注文後、セッション情報をクリア
				session.removeAttribute("cart");
				session.removeAttribute("customer");

				// 完了画面に遷移
				this.gotoPage(request, response, "/order.jsp");
			} catch (DAOException e) {
				e.printStackTrace();
				request.setAttribute("message", "内部エラーが発生しました。");
				this.gotoPage(request, response, "/errInternal.jsp");
			}
		} else {
			request.setAttribute("message", "正しく操作してください。");
			this.gotoPage(request, response, "/errInternal.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * 指定されたURLに遷移する。
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param page 遷移先URL
	 * @throws ServletException
	 * @throws IOException
	 */
	private void gotoPage(HttpServletRequest request, HttpServletResponse response, String page) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		dispatcher.forward(request, response);
	}
}
