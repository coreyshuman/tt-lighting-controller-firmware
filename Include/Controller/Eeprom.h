#ifndef I2C_EEPROM_H
#define	I2C_EEPROM_H

#ifdef	__cplusplus
extern "C" {
#endif

void EepromInit(void);
void EepromRead(unsigned int ee_addr, unsigned char *buf, unsigned int len);
void EepromWritePage(unsigned int ee_addr, unsigned char *buf, unsigned int len);
void EepromWrite(unsigned int ee_addr, unsigned char *buf, unsigned int len);


#ifdef	__cplusplus
}
#endif

#endif	/* I2C_EEPROM_H */

