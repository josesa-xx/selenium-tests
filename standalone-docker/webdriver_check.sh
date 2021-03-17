#!/bin/bash -xe
pip install selenium==4.0.0.b2
python -c '
from selenium import webdriver
firefox_options = webdriver.FirefoxOptions()
driver = webdriver.Remote(
    command_executor="http://selenium-hub:4444/wd/hub",
    options=firefox_options
)
try:
  driver.get("http://demoapp:8000")
  driver.save_screenshot("./screenshot.png")
finally:
  driver.quit()
'
