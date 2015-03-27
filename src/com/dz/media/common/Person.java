package com.dz.media.common;

public class Person {

	private String name;
	private int age;
	private String sex;
	
	public Person(String name,String sex){
		this.age=18;
		this.name=name;
		this.sex=sex;
	}
	public Person(String name,int age,String sex){
		this.age=age;
		this.name=name;
		this.sex=sex;
	}
	public void sayHi(String msg){
		System.out.println(msg);
	}
	public void introduceSelf(String msg){
		System.out.println(msg);
	}
	
	
	public static void main(String[] args) {
		Person p1=new Person("亚当","男");
		Person p2=new Person("夏娃", "女");
		p1.sayHi("亚当，我想你了！！！");
		p2.introduceSelf("我是夏娃,我们造小人去吧!!!");
	}
}
