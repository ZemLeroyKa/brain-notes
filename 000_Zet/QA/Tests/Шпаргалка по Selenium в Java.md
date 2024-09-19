https://testengineer.ru/selenium-webdriver-java-cheat-sheet/

## Инициализация
```java
// Maven: selenium-chrome-driver

import org.openqa.selenium.chrome.ChromeDriver;
WebDriver driver = new ChromeDriver();

// Maven: selenium-firefox-driver

import org.openqa.selenium.firefox.FirefoxDriver;
WebDriver driver = new FirefoxDriver();

// Maven: selenium-edge-driver

import org.openqa.selenium.firefox.EdgeDriver;
WebDriver driver = new EdgeDriver();

// Maven: selenium-ie-driver

import org.openqa.selenium.ie.InternetExplorerDriver;
WebDriver driver = new InternetExplorerDriver();

// Maven: selenium-safari-driver

import org.openqa.selenium.safari.SafariDriver;
WebDriver driver = new SafariDriver();
```
## Локаторы
```java
driver.findElement(By.className("className"));

driver.findElement(By.cssSelector("css"));

driver.findElement(By.id("id"));

driver.findElement(By.linkText("text"));

driver.findElement(By.name("name"));

driver.findElement(By.partialLinkText("pText"));

driver.findElement(By.tagName("input"));

driver.findElement(By.xpath("//\*[@id='editor']"));

// Найти несколько элементов

List<WebElement> anchors = driver.findElements(By.tagName("a"));

// Поиск элемента внутри другого элемента

WebElement div = driver.findElement(By.tagName("div"))

.findElement(By.tagName("a"));
```

## Операции с элементами
```java
// Переход на страницу

driver.navigate().to("http://google.com");

// Получить заголовок страницы

String title = driver.getTitle();

// Получить текущий URL-адрес

String url = driver.getCurrentUrl();

// Получить HTML-код текущей страницы

String html = driver.getPageSource();

// Перетаскивание (Drag n Drop)

WebElement element = driver.FindElement(

By.xpath("//_[@id='project']/p[1]/div/div[2]"));

Actions move = new Actions(driver);

move.dragAndDropBy(element, 30, 0).build().perform();

// Проверить, видно ли элемент

Assert.assertTrue(driver.findElement(

By.xpath("//_[@id='tve_editor']/div")).isDisplayed());

// Передать файл (upload)

WebElement element = driver.findElement(By.id("RadUpload1file0"));

String filePath = "D:\\WebDriver.Series.Tests\\WebDriver.xml";

element.sendKeys(filePath);

// Промотать фокус к нужному элементу

WebElement link =

driver.findElement(By.partialLinkText("Previous post"));

String js = String.format("window.scroll(0, %d);",

link.getLocation().getY());

((JavascriptExecutor)driver).executeScript(js);

link.click();

// Сделать скриншот элемента

WebElement element =

driver.findElement(By.xpath("//_[@id='tve_editor']/div"));

File screenshotFile =

((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);

BufferedImage fullImg = ImageIO.read(screenshotFile);

Point point = element.getLocation();

int elementWidth = element.getSize().getWidth();

int elementHeight = element.getSize().getHeight();

BufferedImage eleScreenshot = fullImg.getSubimage(point.getX(),

point.getY(), elementWidth, elementHeight);

ImageIO.write(eleScreenshot, "png", screenshotFile);

String tempDir = getProperty("java.io.tmpdir");

File destFile = new File(Paths.get(tempDir, fileName +

".png").toString());

FileUtils.getFileUtils().copyFile(screenshotFile, destFile);

// Фокус на элементе

WebElement link =

driver.findElement(By.partialLinkText("Previous post"));

Actions action = new Actions(driver);

action.moveToElement(link).build().perform();

// Ожидание видимости элемента

WebDriverWait wait = new WebDriverWait(driver, 30);

wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(

By.xpath("//_[@id='tve_editor']/div[2]/div[2]/div/div")));
```
## Операции с браузером

```java
// Обработка всплывающих JavaScript-окон

Alert alert = driver.switchTo().alert();

alert.accept();

alert.dismiss();

// Переключение между окнами или вкладками

Set<String> windowHandles = driver.getWindowHandles();

String firstTab = (String)windowHandles.toArray()[1];

String lastTab = (String)windowHandles.toArray()[2];

driver.switchTo().window(lastTab);

// История навигации

driver.navigate().back();

driver.navigate().refresh();

driver.navigate().forward();

// Развернуть окно

driver.manage().window().maximize();

// Добавить cookie

Cookie newCookie = new Cookie("customName", "customValue");

driver.manage().addCookie(newCookie);

// Получить все cookie

Set<Cookie> cookies = driver.manage().getCookies();

// Удаление cookie по имени

driver.manage().deleteCookieNamed("CookieName");

// Удалить все cookie-файлы

driver.manage().deleteAllCookies();

// Снять скриншот всего экрана

File srceenshotFile =

((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);

String tempDir = getProperty("java.io.tmpdir");

File destFile = new File(Paths.get(tempDir, fileName +

".png").toString());

FileUtils.getFileUtils().copyFile(srceenshotFile, destFile);

// Ожидать полной загрузки страницы с помощью JavaScript

WebDriverWait wait = new WebDriverWait(driver, 30);

wait.until(x -> {

((String)((JavascriptExecutor)driver).executeScript(

"return document.readyState")).equals("complete");

});

// Переключиться на фрейм

driver.switchTo().frame(1);

driver.switchTo().frame("frameName");

WebElement element = driver.findElement(By.id("id"));

driver.switchTo().frame(element);

// Переключиться на дефолтный документ

driver.switchTo().defaultContent();
```

## Конфигурации браузера

```java
// Использовать указанный Firefox-профиль

ProfilesIni profile = new ProfilesIni();

FirefoxProfile firefoxProfile = profile.getProfile("ProfileName");

FirefoxOptions firefoxOptions = new FirefoxOptions();

firefoxOptions.setProfile(firefoxProfile);

driver = new FirefoxDriver(firefoxOptions);

// Установить HTTP-прокси в Firefox

ProfilesIni profile = new ProfilesIni();

FirefoxProfile firefoxProfile = new FirefoxProfile();

firefoxProfile.setPreference("network.proxy.type", 1);

firefoxProfile.setPreference("network.proxy.http", "myproxy.com");

firefoxProfile.setPreference("network.proxy.http_port", 3239);

FirefoxOptions firefoxOptions = new FirefoxOptions();

firefoxOptions.setProfile(firefoxProfile);

driver = new FirefoxDriver(firefoxOptions);

// Установить HTTP-прокси в Chrome

var proxy = new Proxy();

proxy.setProxyType(Proxy.ProxyType.MANUAL);

proxy.setAutodetect(false);

proxy.setSslProxy("127.0.0.1:3239");

ChromeOptions chromeOptions = new ChromeOptions();

chromeOptions.setProxy(proxy);

driver = new ChromeDriver(chromeOptions);

// Принимать все сертификаты в Firefox

FirefoxProfile firefoxProfile = new FirefoxProfile();

firefoxProfile.setAcceptUntrustedCertificates(true);

firefoxProfile.setAssumeUntrustedCertificateIssuer(false);

FirefoxOptions firefoxOptions = new FirefoxOptions();

firefoxOptions.setProfile(firefoxProfile);

driver = new FirefoxDriver(firefoxOptions);

// Принимать все сертификаты в Chrome

ChromeOptions chromeOptions = new ChromeOptions();

chromeOptions.addArguments("--ignore-certificate-errors");

driver = new ChromeDriver(chromeOptions);

// Установить опции в Chrome

ChromeOptions chromeOptions = new ChromeOptions();

chromeOptions.addArguments("user-data-dir=C:\\Path\\To\\User Data");

driver = new ChromeDriver(chromeOptions);

// Отключить JavaScript в Firefox

ProfilesIni profile = new ProfilesIni();

FirefoxProfile firefoxProfile = profile.getProfile("ProfileName");

firefoxProfile.setPreference("javascript.enabled", false);

FirefoxOptions firefoxOptions = new FirefoxOptions();

firefoxOptions.setProfile(firefoxProfile);

driver = new FirefoxDriver(firefoxOptions);

// Установить дефолтный таймаут загрузки страницы

driver.manage().timeouts().pageLoadTimeout(10, TimeUnit.SECONDS);

// Start Firefox with plugins

FirefoxProfile profile = new FirefoxProfile();

firefoxProfile.addExtension(new

File("C:\\extensionsLocation\\extension.xpi"));

FirefoxOptions firefoxOptions = new FirefoxOptions();

firefoxOptions.setProfile(firefoxProfile);

driver = new FirefoxDriver(firefoxOptions);

// Запустить Firefox с плагинами

ChromeOptions chromeOptions = new ChromeOptions();

chromeOptions.addArguments("load-extension=/path/to/extension");

driver = new ChromeDriver(chromeOptions);

// Запустить Chrome с нераспакованным плагином

ChromeOptions chromeOptions = new ChromeOptions();

chromeOptions.addExtensions(new File("local/path/to/extension.crx"));

driver = new ChromeDriver(chromeOptions);

// Изменить папку сохранения файлов по дефолту

FirefoxProfile firefoxProfile = new FirefoxProfile();

String downloadFilepath = "c:\\temp";

firefoxProfile.setPreference("browser.download.folderList", 2);

firefoxProfile.setPreference("browser.download.dir", downloadFilepath);

firefoxProfile.setPreference("browser.download.manager.alertOnEXEOpen",

false);

firefoxProfile.setPreference("browser.helperApps.neverAsk.saveToDisk",

"application/msword, application/binary, application/ris, text/csv,

image/png, application/pdf, text/html, text/plain, application/zip,

application/x-zip, application/x-zip-compressed, application/download,

application/octet-stream"));

FirefoxOptions firefoxOptions = new FirefoxOptions();

firefoxOptions.setProfile(firefoxProfile);

driver = new FirefoxDriver(firefoxOptions);
```