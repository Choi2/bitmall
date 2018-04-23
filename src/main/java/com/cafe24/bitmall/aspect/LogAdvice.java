package com.cafe24.bitmall.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Component
@Aspect
public class LogAdvice {

	private static final Logger logger = LoggerFactory.getLogger(LogAdvice.class);
	
	
	@Around("execution(* com.cafe24.bitmall.controller..*.*(..))")
	public Object aroundAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		logger.debug("=======================aroundAdvice=========================");
		StopWatch watch = new StopWatch(joinPoint.toShortString());
		watch.start();
		String signatureInfo = getSignatureInfo(joinPoint);
		logger.debug("=>> " + signatureInfo);
		Object retVal = joinPoint.proceed();
		logger.debug("<<= " + signatureInfo + (retVal != null ? " : " + retVal : ""));
		watch.stop();
		logger.debug(watch.prettyPrint());
		logger.debug("============================================================");
		return retVal;
	}

	public String getSignatureInfo(JoinPoint joinPoint) {
		logger.debug("=====================getSignatureInfo=========================");
		String signatureName = joinPoint.getSignature().getName();
		String className = joinPoint.getTarget().getClass().getSimpleName();
		StringBuilder sb = new StringBuilder();
		sb.append(className).append('.').append(signatureName).append('(');
		Object[] args = joinPoint.getArgs();
		if (args != null && args.length > 0) {
			for (int i = 0; i < args.length; i++) {
				if (args[i] instanceof String)
					sb.append('\"');
				sb.append(args[i]);
				if (args[i] instanceof String)
					sb.append('\"');
				if (i < args.length - 1) {
					sb.append(',');
				}
			}
		}
		sb.append(')');

		return sb.toString();
	}
}
