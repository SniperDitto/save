package pkg.Unit;

import pkg.Commons.IZerg;
import pkg.Commons.Species;

public class Zergling extends Unit implements IZerg{
	
	public Zergling() {
		super(2, 10);
	}
	
	//---------------------------
	public int getOffence() {
		return this.offence;
	}
	public void setOffence(int offense) {
		this.offence = offense;
	}
	public int getHealth() {
		return this.health;
	}
	public void setHealth(int health) {
		this.health = health;
	}

	//-------------------------
	
	public void run() {
		System.out.println("저글링 "+this.unitName+"이(가) 빠르게 달린다.");
	}

	@Override
	public void attack(Unit enemy) {
		//1. 같은편인지
		if(enemy instanceof ) {
			//2. 지상유닛, 공중유닛 공격 불가 여부
			//-------------------------추가하기
			//3. 체력 확인
			if(enemy.health>0 && enemy.isAlive) {
				enemy.health-=this.offence;
				System.out.println("적의 체력을 "
						+this.offence+"만큼 감소시켰습니다.");
				System.out.println("상대 "+enemy.unitName
							+"의 체력 : "+enemy.health);
				//4. 죽이기
				if(enemy.health<=0) {
					enemy.die();
				}
			}
			else {
				System.out.println("상대 유닛이 이미 사망한 상태입니다.");
			}
		}
		else {
			System.out.println("아군을 공격할 수 없습니다.");
		}
	}
	
	

	@Override
	public void upgrade() {
		this.grade++;
		this.offence++;
		System.out.println("등급이 상승해 공격력이 1 증가합니다");
		System.out.println("현재 공격력 : "+this.offence);
	}

	@Override
	public void die() {
		this.health = 0;
		this.isAlive = false;
		System.out.println("저글링 "+this.unitName+"이(가) 사망했습니다");
		//이 유닛 삭제하기
	}

	
	
}
