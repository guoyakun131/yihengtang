package com.yihengtang.yihengtang.util;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class OpenHttps {

	//����http����  requestUrlΪ�����ַ  requestMethod����ʽ��ֵΪ"GET"��"POST"  
    public static String httpRequest(String requestUrl,String requestMethod,String outputStr){  
        StringBuffer buffer=null;  
        try{  
        URL url=new URL(requestUrl);  
        HttpURLConnection conn=(HttpURLConnection)url.openConnection();  
        conn.setDoOutput(true);  
        conn.setDoInput(true);  
        conn.setRequestMethod(requestMethod);  
        conn.connect();  
        //����������д���� Ҳ���Ƿ���http������Ҫ���Ĳ���  
        if(null!=outputStr){  
            OutputStream os=conn.getOutputStream();  
            os.write(outputStr.getBytes("utf-8"));  
            os.close();  
        }  
          
        //��ȡ�������˷��ص�����  
        InputStream is=conn.getInputStream();  
        InputStreamReader isr=new InputStreamReader(is,"utf-8");  
        BufferedReader br=new BufferedReader(isr);  
        buffer=new StringBuffer();  
        String line=null;  
        while((line=br.readLine())!=null){  
            buffer.append(line);  
        }  
        }catch(Exception e){  
            e.printStackTrace();  
        }  
        return buffer.toString();  
    }  
    
}
