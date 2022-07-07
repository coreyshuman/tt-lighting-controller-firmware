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
ifeq "$(wildcard nbproject/Makefile-local-default__bootloaded_.mk)" "nbproject/Makefile-local-default__bootloaded_.mk"
include nbproject/Makefile-local-default__bootloaded_.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default__bootloaded_
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
	${MAKE}  -f nbproject/Makefile-default__bootloaded_.mk dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX230F064D
MP_LINKER_FILE_OPTION=,--script="..\..\linker_scripts\app_32MX230F064D.ld"
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
${OBJECTDIR}/_ext/1332549744/Lighting.o: ../../Source/Controller/Lighting.c  .generated_files/flags/default__bootloaded_/9c38db38287be6cc14161a12ffb6ff23ca846865 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Lighting.o.d" -o ${OBJECTDIR}/_ext/1332549744/Lighting.o ../../Source/Controller/Lighting.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Controller.o: ../../Source/Controller/Controller.c  .generated_files/flags/default__bootloaded_/2d4b3842a4c1dc8f89d6b01aed5ff5457cf28b30 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Controller.o.d" -o ${OBJECTDIR}/_ext/1332549744/Controller.o ../../Source/Controller/Controller.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Animation.o: ../../Source/Controller/Animation.c  .generated_files/flags/default__bootloaded_/40a44e36c527d8dfab8d93a9c4e16798e6e5df63 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Animation.o.d" -o ${OBJECTDIR}/_ext/1332549744/Animation.o ../../Source/Controller/Animation.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Fan.o: ../../Source/Controller/Fan.c  .generated_files/flags/default__bootloaded_/553f475a671ef3422a01022b95b6b2b02c94e46c .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Fan.o.d" -o ${OBJECTDIR}/_ext/1332549744/Fan.o ../../Source/Controller/Fan.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Eeprom.o: ../../Source/Controller/Eeprom.c  .generated_files/flags/default__bootloaded_/12f1e60a5f04c8edd279d48b27f5fa269bd25857 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Eeprom.o.d" -o ${OBJECTDIR}/_ext/1332549744/Eeprom.o ../../Source/Controller/Eeprom.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Config.o: ../../Source/Controller/Config.c  .generated_files/flags/default__bootloaded_/966093bd4a877d701663e779dfee9c75d17aa302 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Config.o.d" -o ${OBJECTDIR}/_ext/1332549744/Config.o ../../Source/Controller/Config.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Util.o: ../../Source/Controller/Util.c  .generated_files/flags/default__bootloaded_/a5ba7764cbfe00a878890cafa497d432b846b783 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Util.o.d" -o ${OBJECTDIR}/_ext/1332549744/Util.o ../../Source/Controller/Util.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Debug.o: ../../Source/Controller/Debug.c  .generated_files/flags/default__bootloaded_/65b5576236cf445e468ec0c7d9540c8239225321 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Debug.o.d" -o ${OBJECTDIR}/_ext/1332549744/Debug.o ../../Source/Controller/Debug.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o: ../../Source/USB/Usb_HID_tasks_application.c  .generated_files/flags/default__bootloaded_/6ad7cbbc83f64e8ed5593e304adf9e0db6c7333c .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d" -o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o ../../Source/USB/Usb_HID_tasks_application.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o: ../../Source/USB/usb_descriptors_app.c  .generated_files/flags/default__bootloaded_/c99f78451cc2ba925646598d3db6d9148d68d9f0 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o ../../Source/USB/usb_descriptors_app.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_device.o: ../../Source/USB/usb_device.c  .generated_files/flags/default__bootloaded_/e9a6e2b7e3211d1f76f409ecdec902e2e0908fff .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_device.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_device.o ../../Source/USB/usb_device.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_function_hid.o: ../../Source/USB/usb_function_hid.c  .generated_files/flags/default__bootloaded_/9d94bf512ac7a50dbbbc958bbcec6e2a3191d41d .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ../../Source/USB/usb_function_hid.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/Main.o: ../../Source/Main.c  .generated_files/flags/default__bootloaded_/f8f02dac8670ab3c13391e72b149add23744d905 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Main.o.d" -o ${OBJECTDIR}/_ext/1787047461/Main.o ../../Source/Main.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/Exception.o: ../../Source/Exception.c  .generated_files/flags/default__bootloaded_/4dfbe99cc9f63735d0686e45b45d763c13537719 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Exception.o.d" -o ${OBJECTDIR}/_ext/1787047461/Exception.o ../../Source/Exception.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1332549744/Lighting.o: ../../Source/Controller/Lighting.c  .generated_files/flags/default__bootloaded_/f7a462c220061fd4dbe71195fe0469d2178591a9 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Lighting.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Lighting.o.d" -o ${OBJECTDIR}/_ext/1332549744/Lighting.o ../../Source/Controller/Lighting.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Controller.o: ../../Source/Controller/Controller.c  .generated_files/flags/default__bootloaded_/db94c23dc80e904c6c9d218c42822f6c277e0b4 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Controller.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Controller.o.d" -o ${OBJECTDIR}/_ext/1332549744/Controller.o ../../Source/Controller/Controller.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Animation.o: ../../Source/Controller/Animation.c  .generated_files/flags/default__bootloaded_/89cc336b89fe5e3e2be6668d93e0fdf0b178b508 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Animation.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Animation.o.d" -o ${OBJECTDIR}/_ext/1332549744/Animation.o ../../Source/Controller/Animation.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Fan.o: ../../Source/Controller/Fan.c  .generated_files/flags/default__bootloaded_/af7983937ed923cd8ef8a30ddfa77c0163917774 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Fan.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Fan.o.d" -o ${OBJECTDIR}/_ext/1332549744/Fan.o ../../Source/Controller/Fan.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Eeprom.o: ../../Source/Controller/Eeprom.c  .generated_files/flags/default__bootloaded_/59bdcc6e0569f0f4b5276d956c9e13b4d46f46e1 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Eeprom.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Eeprom.o.d" -o ${OBJECTDIR}/_ext/1332549744/Eeprom.o ../../Source/Controller/Eeprom.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Config.o: ../../Source/Controller/Config.c  .generated_files/flags/default__bootloaded_/2b43159bcfb1d69c09ee8656394fe31c4ccb8fb3 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Config.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Config.o.d" -o ${OBJECTDIR}/_ext/1332549744/Config.o ../../Source/Controller/Config.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Util.o: ../../Source/Controller/Util.c  .generated_files/flags/default__bootloaded_/b068654e967b3e1bf8f60e241e15fc8a1987c091 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Util.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Util.o.d" -o ${OBJECTDIR}/_ext/1332549744/Util.o ../../Source/Controller/Util.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1332549744/Debug.o: ../../Source/Controller/Debug.c  .generated_files/flags/default__bootloaded_/98698d0bf6ec62743432e604320ac0aadfcef8d4 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1332549744" 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o.d 
	@${RM} ${OBJECTDIR}/_ext/1332549744/Debug.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1332549744/Debug.o.d" -o ${OBJECTDIR}/_ext/1332549744/Debug.o ../../Source/Controller/Debug.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o: ../../Source/USB/Usb_HID_tasks_application.c  .generated_files/flags/default__bootloaded_/33ef45f111911a6fa98fbea86fcddf2600941887 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o.d" -o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_application.o ../../Source/USB/Usb_HID_tasks_application.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o: ../../Source/USB/usb_descriptors_app.c  .generated_files/flags/default__bootloaded_/b159aef4f12ad24a242219fd5bd81c60037282d0 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_descriptors_app.o ../../Source/USB/usb_descriptors_app.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_device.o: ../../Source/USB/usb_device.c  .generated_files/flags/default__bootloaded_/9ef55a9dd5bd5307349b2a11d7bbd3e6003d9ad2 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_device.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_device.o ../../Source/USB/usb_device.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_function_hid.o: ../../Source/USB/usb_function_hid.c  .generated_files/flags/default__bootloaded_/2c8ef1d7a7ff5c79d276c03740acf987ed89f15f .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ../../Source/USB/usb_function_hid.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/Main.o: ../../Source/Main.c  .generated_files/flags/default__bootloaded_/bf19c40599e5031635cf55ce6fa83d2d12fd48c8 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Main.o.d" -o ${OBJECTDIR}/_ext/1787047461/Main.o ../../Source/Main.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/Exception.o: ../../Source/Exception.c  .generated_files/flags/default__bootloaded_/f9a2361ee4b8e70067eb238b2e6a9b14c5b0da89 .generated_files/flags/default__bootloaded_/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Exception.o.d" -o ${OBJECTDIR}/_ext/1787047461/Exception.o ../../Source/Exception.c    -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../../linker_scripts/app_32MX230F064D.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-L"../../MPLAB_Workspace",-Map="$(BINDIR_)$(TARGETBASE).map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../../linker_scripts/app_32MX230F064D.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default__bootloaded_=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-L"../../MPLAB_Workspace",-Map="$(BINDIR_)$(TARGETBASE).map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Application.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default__bootloaded_
	${RM} -r dist/default__bootloaded_

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
