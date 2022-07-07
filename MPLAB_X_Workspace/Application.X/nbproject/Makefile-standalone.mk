#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-standalone.mk)" "nbproject/Makefile-local-standalone.mk"
include nbproject/Makefile-local-standalone.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=standalone
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../Source/Controller/Lighting.c ../../Source/Controller/Controller.c ../../Source/Controller/Animation.c ../../Source/Controller/Fan.c ../../Source/Controller/Eeprom.c ../../Source/Controller/Config.c ../../Source/Controller/Util.c ../../Source/Controller/Debug.c ../../Source/USB/Usb_HID_tasks_application.c ../../Source/USB/usb_descriptors_app.c ../../Source/USB/usb_device.c ../../Source/USB/usb_function_hid.c ../../Source/Main.c ../../Source/Exception.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1332549744/Lighting.o ${OBJECTDIR}/_ext/1332549744/Controller.o ${OBJECTDIR}/_ext/1332549744/Animation.o ${OBJECTDIR}/_ext/1332549744/Fan.o ${OBJECTDIR}/_ext/1332549744/Eeprom.o ${OBJECTDIR}/_ext/1332549744/Config.o ${OBJECTDIR}/_ext/1332549744/Util.o ${OBJECTDIR}/_ext/1332549744/Debug.o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o ${OBJECTDIR}/_ext/313519312/usb_device.o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ${OBJECTDIR}/_ext/1787047461/Main.o ${OBJECTDIR}/_ext/1787047461/Exception.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1332549744/Lighting.o.d ${OBJECTDIR}/_ext/1332549744/Controller.o.d ${OBJECTDIR}/_ext/1332549744/Animation.o.d ${OBJECTDIR}/_ext/1332549744/Fan.o.d ${OBJECTDIR}/_ext/1332549744/Eeprom.o.d ${OBJECTDIR}/_ext/1332549744/Config.o.d ${OBJECTDIR}/_ext/1332549744/Util.o.d ${OBJECTDIR}/_ext/1332549744/Debug.o.d ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d ${OBJECTDIR}/_ext/313519312/usb_device.o.d ${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d ${OBJECTDIR}/_ext/1787047461/Main.o.d ${OBJECTDIR}/_ext/1787047461/Exception.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1332549744/Lighting.o ${OBJECTDIR}/_ext/1332549744/Controller.o ${OBJECTDIR}/_ext/1332549744/Animation.o ${OBJECTDIR}/_ext/1332549744/Fan.o ${OBJECTDIR}/_ext/1332549744/Eeprom.o ${OBJECTDIR}/_ext/1332549744/Config.o ${OBJECTDIR}/_ext/1332549744/Util.o ${OBJECTDIR}/_ext/1332549744/Debug.o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o ${OBJECTDIR}/_ext/313519312/usb_device.o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ${OBJECTDIR}/_ext/1787047461/Main.o ${OBJECTDIR}/_ext/1787047461/Exception.o

# Source Files
SOURCEFILES=../../Source/Controller/Lighting.c ../../Source/Controller/Controller.c ../../Source/Controller/Animation.c ../../Source/Controller/Fan.c ../../Source/Controller/Eeprom.c ../../Source/Controller/Config.c ../../Source/Controller/Util.c ../../Source/Controller/Debug.c ../../Source/USB/Usb_HID_tasks_application.c ../../Source/USB/usb_descriptors_app.c ../../Source/USB/usb_device.c ../../Source/USB/usb_function_hid.c ../../Source/Main.c ../../Source/Exception.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-standalone.mk dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX230F064D
MP_LINKER_FILE_OPTION=,--script="..\..\linker_scripts\app_32MX230F064D_standalone.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1332549744/Lighting.o: ../../Source/Controller/Lighting.c  .generated_files/flags/standalone/14ddb8b9576e535eddf84ad133be4f30ec72cee0 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Lighting.o.d" -o ${OBJECTDIR}/_ext/1332549744/Lighting.o ../../Source/Controller/Lighting.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Controller.o: ../../Source/Controller/Controller.c  .generated_files/flags/standalone/3376427dced60d95d68d0cd17dd5edbaeeb4c04b .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Controller.o.d" -o ${OBJECTDIR}/_ext/1332549744/Controller.o ../../Source/Controller/Controller.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Animation.o: ../../Source/Controller/Animation.c  .generated_files/flags/standalone/75f98cc5a9bbca48ebf64a6704ff7d7e0962915e .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Animation.o.d" -o ${OBJECTDIR}/_ext/1332549744/Animation.o ../../Source/Controller/Animation.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Fan.o: ../../Source/Controller/Fan.c  .generated_files/flags/standalone/aee6674ffe605769ec558f2016968fbf14f94f08 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Fan.o.d" -o ${OBJECTDIR}/_ext/1332549744/Fan.o ../../Source/Controller/Fan.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Eeprom.o: ../../Source/Controller/Eeprom.c  .generated_files/flags/standalone/55d2f5299eb019e5571b74dd755c99a156b0e21e .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Eeprom.o.d" -o ${OBJECTDIR}/_ext/1332549744/Eeprom.o ../../Source/Controller/Eeprom.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Config.o: ../../Source/Controller/Config.c  .generated_files/flags/standalone/65ee53988a2e4c8bf5414bcba4723674db738559 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Config.o.d" -o ${OBJECTDIR}/_ext/1332549744/Config.o ../../Source/Controller/Config.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Util.o: ../../Source/Controller/Util.c  .generated_files/flags/standalone/b1f98fc8f6af4a942a562570b843e0a0d4a0b274 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Util.o.d" -o ${OBJECTDIR}/_ext/1332549744/Util.o ../../Source/Controller/Util.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Debug.o: ../../Source/Controller/Debug.c  .generated_files/flags/standalone/8fbb314f03b3a45d62dcfbb6f57dd3f4ca42feb .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Debug.o.d" -o ${OBJECTDIR}/_ext/1332549744/Debug.o ../../Source/Controller/Debug.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o: ../../Source/USB/Usb_HID_tasks_application.c  .generated_files/flags/standalone/da7a42375dc00e736febb2eea55019f885732b2c .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d" -o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o ../../Source/USB/Usb_HID_tasks_application.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o: ../../Source/USB/usb_descriptors_app.c  .generated_files/flags/standalone/7d49f777daa604ad9907e27ba5800d886e9a7354 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o ../../Source/USB/usb_descriptors_app.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_device.o: ../../Source/USB/usb_device.c  .generated_files/flags/standalone/9fd52cbc491f20d0793def69b510123e564a6392 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_device.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_device.o ../../Source/USB/usb_device.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_function_hid.o: ../../Source/USB/usb_function_hid.c  .generated_files/flags/standalone/e9282b4fad93961e68fb6cc6fb53583a00b44f64 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ../../Source/USB/usb_function_hid.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/Main.o: ../../Source/Main.c  .generated_files/flags/standalone/7234a66bc49fc76bcf0de4b82822d665d04d716e .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Main.o.d" -o ${OBJECTDIR}/_ext/1787047461/Main.o ../../Source/Main.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/Exception.o: ../../Source/Exception.c  .generated_files/flags/standalone/209ede09d45ab8ca0f9b374363559a33147ef993 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Exception.o.d" -o ${OBJECTDIR}/_ext/1787047461/Exception.o ../../Source/Exception.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1332549744/Lighting.o: ../../Source/Controller/Lighting.c  .generated_files/flags/standalone/5817e8c6d3360ac49bb984c9ff2b699b6086a2bb .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Lighting.o.d" -o ${OBJECTDIR}/_ext/1332549744/Lighting.o ../../Source/Controller/Lighting.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Controller.o: ../../Source/Controller/Controller.c  .generated_files/flags/standalone/5fffc6c6034ca934c27b2e5fcdd2b790668c75e5 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Controller.o.d" -o ${OBJECTDIR}/_ext/1332549744/Controller.o ../../Source/Controller/Controller.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Animation.o: ../../Source/Controller/Animation.c  .generated_files/flags/standalone/744294b648c58483daa372916baeb782d1c1bd15 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Animation.o.d" -o ${OBJECTDIR}/_ext/1332549744/Animation.o ../../Source/Controller/Animation.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Fan.o: ../../Source/Controller/Fan.c  .generated_files/flags/standalone/a228f1878666da19c48b894133f4ad0e109d81ac .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Fan.o.d" -o ${OBJECTDIR}/_ext/1332549744/Fan.o ../../Source/Controller/Fan.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Eeprom.o: ../../Source/Controller/Eeprom.c  .generated_files/flags/standalone/4debd74958324dcb77996c3b751d221d5a66dddc .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Eeprom.o.d" -o ${OBJECTDIR}/_ext/1332549744/Eeprom.o ../../Source/Controller/Eeprom.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Config.o: ../../Source/Controller/Config.c  .generated_files/flags/standalone/97066713961236772e1436e860bdd6cd0edcc69c .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Config.o.d" -o ${OBJECTDIR}/_ext/1332549744/Config.o ../../Source/Controller/Config.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Util.o: ../../Source/Controller/Util.c  .generated_files/flags/standalone/b308d745cd94b7da923f616a3676d3c2bfb37861 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Util.o.d" -o ${OBJECTDIR}/_ext/1332549744/Util.o ../../Source/Controller/Util.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Debug.o: ../../Source/Controller/Debug.c  .generated_files/flags/standalone/630ce32b3c21a0c808dc7498bed43eb960ee02fd .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Debug.o.d" -o ${OBJECTDIR}/_ext/1332549744/Debug.o ../../Source/Controller/Debug.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o: ../../Source/USB/Usb_HID_tasks_application.c  .generated_files/flags/standalone/d08cd1f5e8e5268668580c0c5bd20366d6184d2b .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d" -o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o ../../Source/USB/Usb_HID_tasks_application.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o: ../../Source/USB/usb_descriptors_app.c  .generated_files/flags/standalone/98c4f8f3b7e9d45eab0a2a7c0511172bd7cddbbb .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o ../../Source/USB/usb_descriptors_app.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_device.o: ../../Source/USB/usb_device.c  .generated_files/flags/standalone/eb7039ab0859f21ee4581e56f0dcaae30c62b8e5 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_device.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_device.o ../../Source/USB/usb_device.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_function_hid.o: ../../Source/USB/usb_function_hid.c  .generated_files/flags/standalone/59aa99c5288a511f27ecead4d2ebf7ee00cea0ea .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ../../Source/USB/usb_function_hid.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/Main.o: ../../Source/Main.c  .generated_files/flags/standalone/39ac45deba2f6affa03e3ae369136d06ab8c2016 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Main.o.d" -o ${OBJECTDIR}/_ext/1787047461/Main.o ../../Source/Main.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/Exception.o: ../../Source/Exception.c  .generated_files/flags/standalone/c570f729741046936fc9a2c8533c0511b473f866 .generated_files/flags/standalone/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O2 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Exception.o.d" -o ${OBJECTDIR}/_ext/1787047461/Exception.o ../../Source/Exception.c    -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../../linker_scripts/app_32MX230F064D_standalone.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-L"../../MPLAB_Workspace",-Map="$(BINDIR_)$(TARGETBASE).map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../../linker_scripts/app_32MX230F064D_standalone.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_standalone=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-L"../../MPLAB_Workspace",-Map="$(BINDIR_)$(TARGETBASE).map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/standalone
	${RM} -r dist/standalone

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
