# spring boot demo
### 在线创建 Spring boot 项目（下载zip包，解压之后直接用idea打开该工程）
[点我打开](https://start.spring.io/)

### 运行项目
运行 src/main/java/com/springboot/demo/springbootDemoApplication 即可

# 【基本的】
- 代码编写规范参照 阿里Java代码编写规范
- 文件目录结构参照本项目的目录

# 【必要的】
- 避免可能会对性能，业务产生的影响。

## 使用驼峰式命名变量、方法和类
java 通用规范不解释

## API编写遵循controller - service - repository的流程 或 repository 直接调用
严格使用controller - service - repository的流程可以减少controller层的依赖
能用Data-Rest方法实现的，优先在repository中解决

## 只能在service层操作数据库
限制只在service层使用db可以获得更好的性能，不能在controller中直接操作数据源

## 对controller层中对能确定校验规则的参数使用注解进行校验
controller只进行参数处理以及结果封装，不涉及具体实现业务逻辑
对controller层的参数进行校验满足快速失败原则 
同时可以明确controller层的职责，让他负责处理请求参数和响应参数 
及时是传入查询条件也有必要校验，如参数是某个id，那么他肯定会大于0
必须满足RESTful API规范，详细见附件

## 事务使用`@org.springframework.transaction.annotation.Transactional`注解，而不是`@javax.transaction.Transactional`
在spring程序中应该使用spring提供的事务注解

## 在使用`@Transactional`时，如果没有修改或者保存操作，声明`@Transactional(readonly=true)`
声明只读的事务可以获得更好的性能

## 实体类对字段进行必要的约束和检查，如字段长度，默认值，索引等
避免脏数据插入数据库，使用尽可能小的数据长度
ID设置单表自增,@GeneratedValue(strategy = GenerationType.IDENTITY)

## 实体类中不能使用基本类型
基本类型具有默认值，会在save时插入数据库，无法使用[Spring Data Example Query API](https://docs.spring.io/spring-data/jpa/docs/2.1.5.RELEASE/reference/html/#query-by-example)

## 在初始化空集合时，尽量初始化其大小
在空间不够时插入数据会使集合进行扩容 
初始化其大小可以减少扩容次数
也可以减少多余的空间消耗

## 确定要加载某个懒加载属性时，使用`@EntityGraph`或者hql的`fetch`触发懒加载
`@EntityGraph`的使用
```java
@Repository
public interface ArticleRepository extends JpaRepository<Article,Long> {
   @EntityGraph(attributePaths = "topics")
   Article findOneWithTopicsById(Long id);
}
```
如果在多处使用同一种`@EntityGraph`，可以使用`@NamedEntityGraph`
```java
@Entity
@NamedEntityGraph(name = "Article.topics", attributeNodes = @NamedAttributeNode("topics"))
public class Article implements Serializable {
    ...
}
```
```java
@Repository
public interface ArticleRepository extends JpaRepository<Article,Long> {
   @EntityGraph(value = "Article.topics")
   Article findOneWithTopicsById(Long id);
}
```
hql fetch 的使用
```java
// hql fetch example
@Repository
public interface ArticleRepository extends JpaRepository<Article,Long> {
   @Query("select article from Article article left join fetch article.topics where article.id =:id")
   Article findOneWithTopicsById(@Param("id") Long id);
}
```
?禁止懒加载，推荐预加载？
？接口文档方式？

## 不允许直接hardcode常量，可能变化的常量应该定义在config中，不会变化的可以定义在static final 变量

# 【推荐的】
- 对性能和业务产生的影响较小，但是可以提高可读性

## 在非controller的spring bean的方法参数和返回值中使用`@Nullable`和`@NonNull`注解
使用空检查注解标注方法可以让使用者清楚哪些参数可以为`null`，哪些参数不可以 
IDEA会检查错误的传参或者可能错误的传参
```java
@NonNull
public Boolean checkNickNameExist(@NonNull String nickName) {
    return this.userRepository.existsByNickName(nickName);
}
```
当然，也可以使用基本类型代替包装类型，基本类型已经传递了永远不会为`null`的信息


## 有条件的加载某个懒加载属性时，使用`org.hibernate.Hibernate#initialize`方法触发懒加载
其实也可以用get的方式触发普通属性的懒加载，使用`Collection#size()`触发集合的懒加载  
不过为了一些触发懒加载之后又不立即使用的情况，`org.hibernate.Hibernate#initialize`方法更有语义

## 不要在service层中做和数据库无关的操作
尽量原子化方法
service层只尽操作数据库的职责，不要把和前端返回绑定的内容处理放在service中
事务是昂贵的，可以将一些与事务无关的操作放在controller层
如数据库查询结果到接口返回bean的转换

## Controller接口尽可能少的返回数据,不推荐使用entity直接返回
减少Object2Json的消耗和节省流量

## 声明`Long`或`Double`的常量使用大写后缀`10L`
"l"比"L"更像1

## 不要无视IDEA的检查
IDEA总能发现可优化的代码和可能出错的代码 
大部分情况都可以使用自动优化他们 
减少冗余代码，让可读性更好

## 对代码中的常量进行提取归类
提取一些可以被共用的常量，使用`static`和`final`修饰它们 
如实体的字段长度
```java
// entity 
@Column(length = User.NAME_MAX_LENGTH)
private String name;

// controller
public void api(@MAX(User.NAME_MAX_LENGTH) String name){}
```
一些不会被共用的常量，也可以提取它们，命名赋予它们语义

## 使用java stream api处理集合

## 使用@ColumnDefault标注实体字段的默认值

## 使用java optional api替换冗长的null检查
```java
// use if
if(a!=null){
    var b = a.prop1;
    if(b!=null){
     c = b.prop2;
    }else{
     c = 10;
    }
}
```

```java
// use optional
Optinal.ofNullable(a).map(v->v.prop1).map(v->v.prop2).orElse(10)
```

https://github.com/spring-projects/spring-data-examples/tree/master/jpa/jpa21#support-for-custom-sqlresultsetmapping-with-constructorresult
