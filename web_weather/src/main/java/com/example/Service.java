package com.example;

import com.example.web_weather.WeatherWSLocator;
import com.example.web_weather.WeatherWSSoap_PortType;

import javax.servlet.*;
import javax.xml.rpc.ServiceException;
import java.io.IOException;
import java.rmi.RemoteException;

public class Service implements Servlet {

    public static String[] getCityWeather(String city) throws RemoteException, ServiceException {
        String[] weather = {};
        WeatherWSLocator locator = new WeatherWSLocator();
        WeatherWSSoap_PortType service = locator.getWeatherWSSoap();
        weather = service.getWeather(city,"");
        return weather;
    }

    @Override
    public void init(ServletConfig servletConfig) throws ServletException {

    }

    @Override
    public ServletConfig getServletConfig() {
        return null;
    }

    @Override
    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public void destroy() {

    }
}
