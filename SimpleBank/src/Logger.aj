import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

import org.aspectj.lang.reflect.Pointcut;

import java.io.BufferedWriter;

public aspect Logger {
	
	pointcut success():
		call (* com.bank.Bank.money*());
	
	after() :success(){
		
		try(BufferedWriter bw = new BufferedWriter(new FileWriter("Log.txt",true))){
			Calendar cal = Calendar.getInstance();
			
			String line = "";
			
	        if ( thisJoinPoint.getSignature().toString().equals("void com.bank.Bank.moneyMakeTransaction()"))  {
	            line = "Realizar transacción,"+cal.getTime()+"\n";
	        }
	        
	        if ( thisJoinPoint.getSignature().toString().equals("void com.bank.Bank.moneyWithdrawal()")) {
	        	line = "Retirar dinero,"+cal.getTime()+"\n";
	        }  
			
			bw.write(line);
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	    
	}
		

}
