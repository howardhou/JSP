# mytags 

## Create Project
- 创建 Java 项目， 不选择任何模板
- 将 Servlet Hello 项目中的 tags 实现类 复制到 src 目录
- 在根目录下新建 META-INF 目录
- 在 META-INF 目录新建 web-fragment.xml 文件
- 将 mytaglib.tld 文件 copy 到 META-INF 目录

## 打包 jar

- https://www.cnblogs.com/qifengshi/p/6036870.html

- 打开Project Structure
- 选择Artifacts
- 点击 + 号， 选择 Jar -> From module with dependencies ... 打开 Create Jar from modules 界面
- Main Class 可以不填，修改 META-INF 目录，不能使用默认值
- 手动添加 web-fragment.xml 和 mytaglib.tld 文件到 META-INF 目录

