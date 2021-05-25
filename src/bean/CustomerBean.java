package bean;

/**
 * customerテーブルの1県のレコードを管理するBeanクラス
 * @author tutor
 */
public class CustomerBean {

	/**
	 * フィールド
	 */
	private int code;       // 顧客番号
	private String name;    // 顧客氏名
	private String address; // 住所
	private String tel;     // 電話番号
	private String email;   // 電子メールアドレス
	private int year;		//配送年
	private int month;		//配送月
	private int date;		//配送日

	/**
	 * デフォルトコンストラクタ
	 */
	public CustomerBean() {

	}

	/**
	 *変更コンストラクタ
	 * @param code
	 * @param name
	 * @param address
	 * @param tel
	 * @param email
	 * @param year
	 * @param month
	 * @param date
	 */
	public CustomerBean(int code, String name, String address, String tel, String email, int year, int month,
			int date) {
		super();
		this.code = code;
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.email = email;
		this.year = year;
		this.month = month;
		this.date = date;
	}

	/**
	 * コンストラクタ
	 * @param code    顧客番号
	 * @param name    顧客氏名
	 * @param address 住所
	 * @param tel     電話番号
	 * @param email   電子メールアドレス
	 */
	/*public CustomerBean(int code, String name, String address, String tel, String email) {
		this.code = code;
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.email = email;
	}
	*/

	/**
	 * アクセサメソッド群
	 */



	public int getCode() {
		return code;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDate() {
		return date;
	}

	public void setDate(int date) {
		this.date = date;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
