from selenium import webdriver
from selenium.webdriver.common.by import By

driver = webdriver.Chrome()
driver.get("https://championshub.app/")
driver.implicitly_wait(10)
login_btn = driver.find_element(By.CSS_SELECTOR, '#root > header > div > div.absolute.top-2.right-4.flex.items-center > button')