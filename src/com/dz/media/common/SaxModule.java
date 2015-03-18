package com.dz.media.common;

import java.io.IOException;
import java.io.InputStream;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import com.dz.media.model.Action;

/**
 * 解析项目目录结构 将xml文件的目录结构存入数据库 初始化项目目录
 * 
 * @author jason
 * 
 */
public class SaxModule {
	private Action nav1, nav2, nav3;

	/**
	 * 开始解析
	 */
	public void start() {
		// 解析器的获取
		// 1、获取sax解析工厂
		try {
			SAXParserFactory sf = SAXParserFactory.newInstance();
			// 2、获取解析器
			SAXParser sp = sf.newSAXParser();

			// 创建xml文件的输入流
			InputStream inStream = this.getClass().getClassLoader()
					.getResourceAsStream("module.xml");

			// 3、解析xml文件，将事件处理器传入。
			sp.parse(inStream, new ModuleHandle());

		} catch (SAXException e) {
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @author jason
	 * 
	 */
	class ModuleHandle extends DefaultHandler {

		@Override
		public void startDocument() throws SAXException {
			// System.out.println("解析文档开始");
		}

		@Override
		public void endDocument() throws SAXException {
			// System.out.println("解析文档结束");
		}

		@Override
		public void startElement(String uri, String localName, String qName,
				Attributes attributes) throws SAXException {
			String aId = "";
			String aName = "";
			String aType = "";
			String aLink = "";
			String aAllow="";
			String aIcon="";
			String aRemark = "";
			int aShow = 0;
			int aOrder = 0;
			if (qName != "nav") {
				aId = attributes.getValue("aId");
				aName = attributes.getValue("aName");
				aType = attributes.getValue("aType");
				aLink = attributes.getValue("aLink");
				aAllow = attributes.getValue("aAllow");
				aIcon = attributes.getValue("aIcon");
				aShow = Integer.parseInt(attributes.getValue("aShow"));
				aOrder = Integer.parseInt(attributes.getValue("aOrder"));
				aRemark = attributes.getValue("aRemark");
			}
			if ("nav1".equals(qName)) {
				nav1 = new Action();
				nav1.set("aId", aId);
				nav1.set("aType", aType);
				nav1.set("aName", aName);
				nav1.set("aLink", aLink);
				nav1.set("aIcon", aIcon);
				nav1.set("aAllow", aAllow);
				nav1.set("aOrder", aOrder);
				nav1.set("aShow", aShow);
				nav1.set("aRemark", aRemark);
			}
			if ("nav2".equals(qName)) {
				nav2 = new Action();
				nav2.set("aId", aId);
				nav2.set("aType", aType);
				nav2.set("aName", aName);
				nav2.set("aLink", aLink);
				nav2.set("aIcon", aIcon);
				nav2.set("aAllow", aAllow);
				nav2.set("aOrder", aOrder);
				nav2.set("aShow", aShow);
				nav2.set("aRemark", aRemark);
			}
			if ("nav3".equals(qName)) {
				nav3 = new Action();
				nav3.set("aId", aId);
				nav3.set("aType", aType);
				nav3.set("aName", aName);
				nav3.set("aLink", aLink);
				nav3.set("aIcon", aIcon);
				nav3.set("aAllow", aAllow);
				nav3.set("aOrder", aOrder);
				nav3.set("aShow", aShow);
				nav3.set("aRemark", aRemark);
			}
		}

		@Override
		public void endElement(String uri, String localName, String qName)
				throws SAXException {

			if ("nav1".equals(qName)) {
				nav1.save();
			}
			if ("nav2".equals(qName)) {
				nav2.save();
			}
			if ("nav3".equals(qName)) {
				nav3.save();
			}

		}

	}

}
