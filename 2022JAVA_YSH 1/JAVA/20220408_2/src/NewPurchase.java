
public class NewPurchase implements IPurchase{
	//다른 구매 업무
	//구매업무의 기본 틀을 상속받았지만 다른 처리 내용일 경우
	public NewPurchase() {}

	@Override
	public void buy() {
		System.out.println("asdf");
	}

	@Override
	public void refund() {
		System.out.println("asdf");
	}

	@Override
	public void showList() {
		System.out.println("asdf");
	}

}
