<%@ page language="java" contentType="image/jpeg; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.awt.*"%>
<%@ page import="java.awt.image.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.imageio.*"%>

<%
	//在内存中创建图象
	int iWidth = 60, iHeight = 18;
	BufferedImage image = new BufferedImage(iWidth, iHeight, BufferedImage.TYPE_INT_RGB);
	//获取图形上下文
	Graphics g = image.getGraphics();
	//设定背景色
	g.setColor(Color.white);
	g.fillRect(1, 0, iWidth, iHeight);
	//画边框
	g.setColor(Color.black);
	g.drawRect(0, 0, iWidth - 1, iHeight - 1);
	//取随机产生的认证码(4位数字)
// 	String rand = request.getParameter("Rand");
	String rand = String.valueOf(Math.random() * 10000);
	rand = rand.substring(0, rand.indexOf("."));
	switch (rand.length()) {
	case 1:
		rand = "000" + rand;
		break;
	case 2:
		rand = "00" + rand;
		break;
	case 3:
		rand = "0" + rand;
		break;
	default:
		rand = rand.substring(0, 4);
		break;
	}
	//将认证码存入SESSION
	request.getSession(true).setAttribute("Rand", rand);
	//将认证码显示到图象中
	g.setColor(Color.black);
	g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
	g.drawString(rand, 10, 15);
	//随机产生88个干扰点,使图象中的认证码不易被其它程序探测到
	Random random = new Random();
	for (int iIndex = 0; iIndex < 88; iIndex++) {
		int x = random.nextInt(iWidth);
		int y = random.nextInt(iHeight);
		g.drawLine(x, y, x, y);
	}
	//图象生效
	g.dispose();
	out.clear();
	out = pageContext.pushBody();
	//输出图象到页面
	ImageIO.write(image, "JPEG", response.getOutputStream());
%>