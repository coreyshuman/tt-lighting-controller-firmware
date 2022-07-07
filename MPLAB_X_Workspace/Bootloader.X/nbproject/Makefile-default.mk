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
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Bootloader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Bootloader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=../../Source/FrameWork/Framework.c ../../Source/USB/usb_descriptors.c ../../Source/USB/Usb_HID_tasks_bootloader.c ../../Source/USB/usb_device.c ../../Source/USB/usb_function_hid.c ../../Source/NVMem.c ../../Source/BootLoader.c ../../Source/Exception.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1094924598/Framework.o ${OBJECTDIR}/_ext/313519312/usb_descriptors.o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_bootloader.o ${OBJECTDIR}/_ext/313519312/usb_device.o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ${OBJECTDIR}/_ext/1787047461/NVMem.o ${OBJECTDIR}/_ext/1787047461/BootLoader.o ${OBJECTDIR}/_ext/1787047461/Exception.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1094924598/Framework.o.d ${OBJECTDIR}/_ext/313519312/usb_descriptors.o.d ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_bootloader.o.d ${OBJECTDIR}/_ext/313519312/usb_device.o.d ${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d ${OBJECTDIR}/_ext/1787047461/NVMem.o.d ${OBJECTDIR}/_ext/1787047461/BootLoader.o.d ${OBJECTDIR}/_ext/1787047461/Exception.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1094924598/Framework.o ${OBJECTDIR}/_ext/313519312/usb_descriptors.o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_bootloader.o ${OBJECTDIR}/_ext/313519312/usb_device.o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ${OBJECTDIR}/_ext/1787047461/NVMem.o ${OBJECTDIR}/_ext/1787047461/BootLoader.o ${OBJECTDIR}/_ext/1787047461/Exception.o

# Source Files
SOURCEFILES=../../Source/FrameWork/Framework.c ../../Source/USB/usb_descriptors.c ../../Source/USB/Usb_HID_tasks_bootloader.c ../../Source/USB/usb_device.c ../../Source/USB/usb_function_hid.c ../../Source/NVMem.c ../../Source/BootLoader.c ../../Source/Exception.c



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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Bootloader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX230F064D
MP_LINKER_FILE_OPTION=,--script="..\..\linker_scripts\btl_32MX230F064D_generic.ld"
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
${OBJECTDIR}/_ext/1094924598/Framework.o: ../../Source/FrameWork/Framework.c  .generated_files/flags/default/be36e04f321891f99938e31b3ad71519b95b149a .generated_files/flags/default/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1094924598" 
	@${RM} ${OBJECTDIR}/_ext/1094924598/Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1094924598/Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -D_BOOTLOADER -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1094924598/Framework.o.d" -o ${OBJECTDIR}/_ext/1094924598/Framework.o ../../Source/FrameWork/Framework.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_descriptors.o: ../../Source/USB/usb_descriptors.c  .generated_files/flags/default/df345e1ae471466cba188b0bb6b8d851f4a2f26b .generated_files/flags/default/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -D_BOOTLOADER -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_descriptors.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_descriptors.o ../../Source/USB/usb_descriptors.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_bootloader.o: ../../Source/USB/Usb_HID_tasks_bootloader.c  .generated_files/flags/default/b029d646be2f3ddd90fd89e3d78ffb264819980b .generated_files/flags/default/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_bootloader.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_bootloader.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -D_BOOTLOADER -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_bootloader.o.d" -o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_bootloader.o ../../Source/USB/Usb_HID_tasks_bootloader.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_device.o: ../../Source/USB/usb_device.c  .generated_files/flags/default/5a10948caaf6b9bfa73be512935974de1e5249e2 .generated_files/flags/default/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -D_BOOTLOADER -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_device.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_device.o ../../Source/USB/usb_device.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_function_hid.o: ../../Source/USB/usb_function_hid.c  .generated_files/flags/default/57fd10da727ca1cfcdcb075fd53568cf9373ac33 .generated_files/flags/default/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -D_BOOTLOADER -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ../../Source/USB/usb_function_hid.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/NVMem.o: ../../Source/NVMem.c  .generated_files/flags/default/390bcea40c68bc344f0ef478cc4680d8a5bb826 .generated_files/flags/default/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/NVMem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/NVMem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -D_BOOTLOADER -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/NVMem.o.d" -o ${OBJECTDIR}/_ext/1787047461/NVMem.o ../../Source/NVMem.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/BootLoader.o: ../../Source/BootLoader.c  .generated_files/flags/default/f7116e325d5fac8210f1699bbc6d905b54968563 .generated_files/flags/default/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/BootLoader.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/BootLoader.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -D_BOOTLOADER -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/BootLoader.o.d" -o ${OBJECTDIR}/_ext/1787047461/BootLoader.o ../../Source/BootLoader.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/Exception.o: ../../Source/Exception.c  .generated_files/flags/default/d0810f05e84b83c580a7fa6c7bf518993aa5fcdc .generated_files/flags/default/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -D_BOOTLOADER -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Exception.o.d" -o ${OBJECTDIR}/_ext/1787047461/Exception.o ../../Source/Exception.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1094924598/Framework.o: ../../Source/FrameWork/Framework.c  .generated_files/flags/default/3a70b288f7955e7b234a6ec85c1b83c4f3d938f0 .generated_files/flags/default/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1094924598" 
	@${RM} ${OBJECTDIR}/_ext/1094924598/Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1094924598/Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -D_BOOTLOADER -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1094924598/Framework.o.d" -o ${OBJECTDIR}/_ext/1094924598/Framework.o ../../Source/FrameWork/Framework.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_descriptors.o: ../../Source/USB/usb_descriptors.c  .generated_files/flags/default/cecc87b27ef26acf10bb6da7f4f2ab88750e1077 .generated_files/flags/default/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_descriptors.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -D_BOOTLOADER -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_descriptors.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_descriptors.o ../../Source/USB/usb_descriptors.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_bootloader.o: ../../Source/USB/Usb_HID_tasks_bootloader.c  .generated_files/flags/default/cbadb9f0e386417ee0f2a23819b161e9eefdad10 .generated_files/flags/default/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_bootloader.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_bootloader.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -D_BOOTLOADER -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_bootloader.o.d" -o ${OBJECTDIR}/_ext/313519312/Usb_HID_tasks_bootloader.o ../../Source/USB/Usb_HID_tasks_bootloader.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_device.o: ../../Source/USB/usb_device.c  .generated_files/flags/default/a6dbfb727d2f91ea69bf69267339b199f1b2311 .generated_files/flags/default/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_device.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -D_BOOTLOADER -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_device.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_device.o ../../Source/USB/usb_device.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/313519312/usb_function_hid.o: ../../Source/USB/usb_function_hid.c  .generated_files/flags/default/988bf5856828dea5dd35fb6f379bb4f35f7e15a0 .generated_files/flags/default/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/313519312" 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/313519312/usb_function_hid.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -D_BOOTLOADER -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/313519312/usb_function_hid.o.d" -o ${OBJECTDIR}/_ext/313519312/usb_function_hid.o ../../Source/USB/usb_function_hid.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/NVMem.o: ../../Source/NVMem.c  .generated_files/flags/default/d9350bfae101d6a89e612070b41274df328cf737 .generated_files/flags/default/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/NVMem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/NVMem.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -D_BOOTLOADER -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/NVMem.o.d" -o ${OBJECTDIR}/_ext/1787047461/NVMem.o ../../Source/NVMem.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/BootLoader.o: ../../Source/BootLoader.c  .generated_files/flags/default/1cf24396f1f6538a5d699fc898045e031a1f1069 .generated_files/flags/default/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/BootLoader.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/BootLoader.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -D_BOOTLOADER -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/BootLoader.o.d" -o ${OBJECTDIR}/_ext/1787047461/BootLoader.o ../../Source/BootLoader.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1787047461/Exception.o: ../../Source/Exception.c  .generated_files/flags/default/de2217ea290083dd0dc8108e977214c6ef40d0e2 .generated_files/flags/default/7ba097bc94b9dc57ccaa532d046fa2c160885927
	@${MKDIR} "${OBJECTDIR}/_ext/1787047461" 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o.d 
	@${RM} ${OBJECTDIR}/_ext/1787047461/Exception.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O1 -fno-common -D_SUPPRESS_PLIB_WARNING -D_DISABLE_OPENADC10_CONFIGPORT_WARNING -D_BOOTLOADER -I"../../Include" -MP -MMD -MF "${OBJECTDIR}/_ext/1787047461/Exception.o.d" -o ${OBJECTDIR}/_ext/1787047461/Exception.o ../../Source/Exception.c    -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Bootloader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../../linker_scripts/btl_32MX230F064D_generic.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -o dist/${CND_CONF}/${IMAGE_TYPE}/Bootloader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-L"../../MPLAB_Workspace",-Map="$(BINDIR_)$(TARGETBASE).map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Bootloader.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../../linker_scripts/btl_32MX230F064D_generic.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION) -mips16 -o dist/${CND_CONF}/${IMAGE_TYPE}/Bootloader.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-L"../../MPLAB_Workspace",-Map="$(BINDIR_)$(TARGETBASE).map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Bootloader.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
