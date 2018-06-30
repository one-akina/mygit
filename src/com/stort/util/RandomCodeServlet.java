package com.stort.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RandomCodeServlet
 */
@WebServlet("/RandomCodeServlet")
public class RandomCodeServlet extends HttpServlet {
      private int width=60; 
      private int height=20;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RandomCodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BufferedImage buffImg=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
		Graphics2D g=buffImg.createGraphics();
		Random random=new Random();
		g.setColor(Color.WHITE);
		g.fillRect(0, 0, width, height);
		Font font = new Font("Times New Roman",Font.PLAIN,18);
		g.setFont(font);
		g.setColor(Color.BLACK);
		g.drawRect(0, 0, width-1, height-1);
		g.setColor(Color.GRAY);
		for(int i=0;i<9;i++) {
			int x=random.nextInt(width);
			int y=random.nextInt(height);
			int x1=random.nextInt(12);
			int y1=random.nextInt(12);
			g.drawLine(x, y, x1, y1);
		}
		StringBuffer randomCode=new StringBuffer();
		int red=0,green=0,blue=0;
		
		for(int i=0;i<4;i++) {
			String strRand=String.valueOf(random.nextInt(10));
			red=random.nextInt(110);
			green=random.nextInt(50);
			blue=random.nextInt(50);
			g.setColor(new Color(red,green,blue));
			g.drawString(strRand, 13*i+6, 16);
			randomCode.append(strRand);
		}
		HttpSession session=request.getSession();
		session.setAttribute("randomCode", randomCode.toString());
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		ServletOutputStream sos=response.getOutputStream();
		ImageIO.write(buffImg, "jpeg", sos);
		sos.close();
	}

	
}
