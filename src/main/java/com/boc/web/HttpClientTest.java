package com.boc.web;
import java.io.*;
import java.net.MalformedURLException;
import java.net.Proxy;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.URL;
import java.nio.charset.StandardCharsets;
public class HttpClientTest {
	public static void main(String[] args) throws IOException {

		
		
		// NOTE: you must manually construct wml_credentials hash map below
		// using information retrieved from your IBM Cloud Watson Machine Learning Service instance 
		Map<String, String> wml_credentials = new HashMap<String, String>()
		{{
			put("url", "https://ibm-watson-ml.mybluemix.net");
			put("username", "e23a612f-6a97-46c8-916b-7dde89b3f534");
			put("password", "29d13701-7238-4430-8a9f-ca35c85f1775");
		}};
		String wml_auth_header = "Basic " +
				Base64.getEncoder().encodeToString((wml_credentials.get("username") + ":" +
					wml_credentials.get("password")).getBytes(StandardCharsets.UTF_8));
		String wml_url = wml_credentials.get("url") + "/v3/identity/token";
		HttpsURLConnection tokenConnection = null;
		HttpsURLConnection scoringConnection = null;
		BufferedReader tokenBuffer = null;
		BufferedReader scoringBuffer = null;
		Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("172.16.100.11", 8389));
		try {
			// Getting WML token
			URL tokenUrl = new URL(wml_url);
			tokenConnection = (HttpsURLConnection) tokenUrl.openConnection(proxy);
			tokenConnection.setDoInput(true);
			tokenConnection.setDoOutput(true);
			tokenConnection.setRequestMethod("GET");
			tokenConnection.setRequestProperty("Authorization", wml_auth_header);
			tokenBuffer = new BufferedReader(new InputStreamReader(tokenConnection.getInputStream()));
			StringBuffer jsonString = new StringBuffer();
			String line;
			while ((line = tokenBuffer.readLine()) != null) {
				jsonString.append(line);
			}
			// Scoring request
			URL scoringUrl = new URL("https://ibm-watson-ml.mybluemix.net/v3/wml_instances/0b72cd79-1bc5-4e43-a825-86c192e214a4/published_models/6bf7067a-60f6-4d6b-a5cf-730641967e8a/deployments/bc72a002-699e-4931-bc93-9706e3c9e798/online");
			String wml_token = "Bearer " +
					jsonString.toString()
							.replace("\"","")
							.replace("}", "")
							.split(":")[1];
			System.out.println("wml_token:"+wml_token);
			scoringConnection = (HttpsURLConnection) scoringUrl.openConnection(proxy);
			scoringConnection.setDoInput(true);
			scoringConnection.setDoOutput(true);
			scoringConnection.setRequestMethod("POST");
			scoringConnection.setRequestProperty("Accept", "application/json");
			scoringConnection.setRequestProperty("Authorization", wml_token);
			scoringConnection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			OutputStreamWriter writer = new OutputStreamWriter(scoringConnection.getOutputStream(), "UTF-8");

			// NOTE: manually define and pass the array(s) of values to be scored in the next line
			String payload = "{\"fields\": [\"CUST_NO\", \"LOANRATE\", \"TOTPRICE\", \"PEREDUBK\", \"OCCUPATION\", \"WKIBUSTY\", \"POSITION\", \"FAM_PERHMMEM\", \"PERHMPER\", \"PERCRCLS\", \"PERNTLNO\", \"INCOMEMON\", \"FAM_INCOMEMON\", \"FAM_PERHMDBT\", \"AUM_AMT\", \"dfx\", \"gjj\", \"shb\", \"tax\"], \"values\": [ [9994075,69.4731,4080000,\"2\",\"60\",28,2,2,1,\"17\",29,49999,0,2947,16052,25125.87,3015.1044,2010.0696,4401.47]]}";
			//String payload="{'values': [[176338644,69.7675,2150000,3,24,2,0,2,1,17,1,49999,0,74161,87,1441.67,173.0004,115.3336,0], [82493969,15.4784,6460653,1,24,2,3,2,0,17,1,2500,0,20832,11979,2300.01,276,184,0]]}";
			writer.write(payload);
			writer.close();

			scoringBuffer = new BufferedReader(new InputStreamReader(scoringConnection.getInputStream()));
			StringBuffer jsonStringScoring = new StringBuffer();
			String lineScoring;
			while ((lineScoring = scoringBuffer.readLine()) != null) {
				jsonStringScoring.append(lineScoring);
			}
			System.out.println(jsonStringScoring);
		} catch (IOException e) {
			System.out.println("The URL is not valid.");
			System.out.println(e.getMessage());
		}
		finally {
			if (tokenConnection != null) {
				tokenConnection.disconnect();
			}
			if (tokenBuffer != null) {
				tokenBuffer.close();
			}
			if (scoringConnection != null) {
				scoringConnection.disconnect();
			}
			if (scoringBuffer != null) {
				scoringBuffer.close();
			}
		}
	}
}