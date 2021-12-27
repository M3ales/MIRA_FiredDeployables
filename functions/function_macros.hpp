#include "..\config_macros.hpp"

#ifndef LOG_BASE
	#define LOG_BASE(level,msg) diag_log text format[QUOTE(ADDON[level]: %1), msg]
	#define LOG(msg) LOG_BASE(INFO, LOG_FILENUMBER(msg))
	#define LOGF_1(msg,arg0) LOG(format[ARR_2(msg,arg0)])
	#define LOGF_2(msg,arg0,arg1) LOG(format[ARR_3(msg,arg0,arg1)])
	#define LOGF_3(msg,arg0,arg1,arg2) LOG(format[ARR_4(msg,arg0,arg1,arg2)])
	#define LOG_ERROR(msg) LOG_BASE(ERR,LOG_FILENUMBER(msg))
	#define LOG_ERRORF_1(msg,arg0) LOG_ERROR(format[ARR_2(msg,arg0)])
	#define LOG_ERRORF_2(msg,arg0,arg1) LOG_ERROR(format[ARR_3(msg,arg0,arg1)])
	#define LOG_FILENUMBER(msg) format [ARR_4('%1 at %2:%3',msg,__FILE__,__LINE__ + 1)]
#else
	diag_log format ["Skipping config_macros.hpp > LOG defines at %1:%2",__FILE__,__LINE__ + 1];
#endif

// Can disable logging if wanted
// #define DISABLE_LOGGING

#ifdef DISABLE_LOGGING
	diag_log format ["Logging Disabled at %1:%2",__FILE__,__LINE__ + 1];
	#define LOG_BASE(level,msg) diag_log text format[QUOTE(ADDON[level]: %1), msg]
	#define LOG(msg) LOG_BASE(INFO, LOG_FILENUMBER(msg))
	#define LOGF_1(msg,arg0) LOG(format[ARR_2(msg,arg0)])
	#define LOGF_2(msg,arg0,arg1) LOG(format[ARR_3(msg,arg0,arg1)])
	#define LOGF_3(msg,arg0,arg1,arg2) LOG(format[ARR_4(msg,arg0,arg1,arg2)])
	#define LOG_ERROR(msg) LOG_BASE(ERR,LOG_FILENUMBER(msg))
	#define LOG_ERRORF_1(msg,arg0) LOG_ERROR(format[ARR_2(msg,arg0)])
	#define LOG_ERRORF_2(msg,arg0,arg1) LOG_ERROR(format[ARR_3(msg,arg0,arg1)])
	#define LOG_FILENUMBER(msg) format [ARR_4('%1 at %2:%3',msg,__FILE__,__LINE__ + 1)]
#endif
