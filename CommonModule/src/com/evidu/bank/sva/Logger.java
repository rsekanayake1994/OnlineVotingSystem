package com.evidu.bank.sva;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
public class Logger {
	public String LogInfo(HttpServletRequest _request)
	{
		String _localAddress = "" + _request.getLocalAddr();
		String _serv = "2018";// shortcode
		String _remoteAddress = "" + _request.getRemoteAddr();
		String _softVersion = "V5.1";
		String _platformID = "IOBD";// +request.getHeader("");
		String _ID = "" + UUID.randomUUID().toString();
		String _logData = "" + _localAddress + "," + _serv + "," + _remoteAddress + "," + _softVersion + ","
				+ _platformID + "," + _ID+",";
		return _logData;
		
	}
}
