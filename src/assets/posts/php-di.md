### 基本概念

#### 依赖注入

> 依赖注入是一种允许我们从硬编码的依赖中解耦出来，从而在运行时或者编译时能够修改的软件设计模式。

以下代码解释了依赖注入的方便性

```php
// SendMessage.php
<?php
/**
 * 在OneDriver中只要实现一个Xsend方法即可,代表了不同的短信发送提供商的驱动接口
 */
class SendMessage implements SendMessageInterface
{
    protected $sdk;
    public function __construct(OneDriver $sdk)
    {
        $this->sdk = $sdk;
    }
    public function send($content)
    {
        $this->sdk->Xsend($this->phone,$content);
    }
  ...
}
```

```php
//SendController.php
...
public function sendMessage(SendMessageInterface $send)
{
    $content = 'Hello My God!';
    $send->setPhone('+86.xxxxxxxxxxx')->send($content);
}  
```

```php
//index.php
$controller = new SendController();
$controller->sendMessage($container->make('send.message'));
```

依赖注入的优点:

- 如果所有的类和函数直接类名或函数名来获取对象,那么由于高度的耦合度测试将显得相当困难。
- 注入接口的好处是在类内部实现有所改变时我们将只需更改类本身而不需关心调用他的其它类或者代码

#### 服务容器

服务容器包含了2个东西。

1. 用于实现依赖注入的服务解析器
2. 用于管理依赖注入的容器

由于PHP原生并不支持依赖注入,所以我们要实现依赖注入则首先必须实现服务的解析,可以解析后即可实现用于管理所有服务的容器。为了方便,一般在PHP框架及类库中一体化服务与容器.

### 轻松实现

> 具体代码请查看本课时源代码中的step1

我们自己可以仿造Laravel或者Symfony的模式来轻松的实现一个自己的服务容器

#### 创建容器

整个服务容器的所有服务皆存储与Container容器类中的$app变量中

```php
// Container.php
 ...
  public function bind($name, $definition){} //绑定服务 
  public function make($name){} //解析服务
  public function alias($serviceName,$alias){} //设置服务的别名
  public function all(){} //获取所有服务
  public function has($name){} //判断服务是否存在在容器内
```

#### 实现容器

> Reflection类库用于PHP的反转控制,是实现DI的核心

在实现过程中,我们用的最多的是ReflectionClass类和ReflectionFunction类,这两个类用于处理PHP的类和函数的反射机制.

它们都是Reflection类的子集,具体使用请查看[官方API](http://php.net/manual/zh/book.reflection.php),这里就不再赘述。。。

我们假定服务有三种模式

- 闭包函数服务
- 对象绑定服务
- 类解析服务

那么我们要在bind(绑定方法)和make(解析方法)中分别对着三种模式进行处理

比如我们添加了factory方法与getArguments方法

factroy方法用于在解析的时候分别处理这三种模式

1. 对象绑定模式则直接返回对象即可
2. 闭包函数模式,则可能会在函数的参数中注入其它服务,所以要单独处理
3. 类解析服务则可能会在类的构造函数中注入其它服务,所以要单独处理

最后我们单独编写一个getArguments方法用于处理参数中含有其它服务的方法用于获取解析后的参数用于factory方法,还有一个值得注意的是alias,我们给一个处理绑定了服务名之后,我们添加一个alias方法,就可以为这个服务设置别名了.我们这里模仿laravel使alias可以为数组亦可为单个字符串别名(如果设置接口或者类名,在数组中会自动转换为字符串)

#### 测试容器

在实现服务容器后,我们编写一些代码用于测试服务容器是否有效

> 我们这里的服务容器是参照Laravel的模式编写,但是建议大家尝试改进,可以模仿Symfony的方法.Symfony是用service.yaml的方式来标准化服务容器,代码较Laravel更加优雅亦读

```php
// services.php
...
$container = new Container();
$container->bind('onedriver',function (){
    return new OneDriver();
});
$container->bind('send.message',SendMessage::class);
$container->alias('onedriver',OneDriver::class);
$container->alias('send.message',[
    SendMessageInterface::class
]);
```

绑定所有服务和设置别名之后即可访问index.php看到效果

上面我们自己写的服务容器为了简便起见很多没有实现，有兴趣的朋友可以结合Composer的自动加载类模式,参照Laravel和Symfony的方案自己扩展一下,就可以实现完整的服务容器方案咯

### Laravel与依赖注入

#### 容器方法

在Laravel中,依赖注入也是采用服务容器的设计模式,以下是它的一些常用容器方法,具体可以去看他的[API文档](https://laravel-china.org/api/5.4/Illuminate/Container/Container.html)

> 我们上面的实现为了方便简易的完成了,大家可以看到下面Laravel就做的比较细致了,比如闭包函数处理模式和普通的类绑定就用一个bind方法,而对象绑定就单独一个instance,设置还设置了singleton这种一次性解析方法,还有tag模式等,大家可以参考一下

- $app->bound(判断服务是否存在)
- $app->resolved(服务解析事件)
- $app->bind(普通的绑定服务模式,当然通过最后一个shared参数就可以设置成共享服务)
- $app->bindIf(按条件绑定)
- $app->singleton(只解析一次，产生的对象后面就一直使用了,可以理解为共享服务)
- $app->instance(直接以对象做为服务来绑定,那当然也是共享服务了)
- $app->make(解析服务)
- $app->tag(创建服务标签,用于归类服务)
- $app->tagged(解析服务标签得到服务数组,并按绑定时候顺序可以通过整数键值获取服务)
- $app->offsetXXX(用于设置,读取,判断一些全局变量,比如你要设置一个系统变量,那么就用他)
- $app->alias(老朋友了,我们上面就自己实现了,用于设置服务别名)
- $app->isAlias和$app->isShared(这就不用解释了)
- $app->when,$app->needs,$app->give(画蛇添足的地方,其实按条件解析如果实现同一个接口注入后,在依赖类中使用一个give方法就解析不同服务不是更好吗？用when,needs不仅没解决问题还增加了耦合度。。。)
- 。。。其它的自己看一下就明白了

#### 具体使用

因为Laravel是使用Composer机制,所以不需要像我们上面写的一样,自己require文件,设置好命名空间就能加载类了,这里重要讲解的是Laravel的Provider机制

> 类似Facades这种样子货大家自己看一下[文档](https://laravel-china.org/docs/5.4/facades)就明白了

首先大家要明白一点,Laravel中的Constract,Provider,Facades这些概念并不是什么高端的东西,非常好理解,我们还是回到我们上面自己写的服务容器案例。

对比一下Laravel的文档可以清楚的知道,所谓Constract不过是interface而已-接口,用于提供一套公有的方法,让具体实现的类来继承,然后通过服务绑定就可以解析了

##### 创建服务

$app->bind(服务名,"具体实现")

> "具体实现"可以是类,对象或者闭包什么的,绑定方法可以按自己的需要选择bind,singleton以及instance,
>
> 也可以根据条件绑定(bindIf),或者根据依赖类绑定(when,needs,give)

接着$app->alias(服务名,[一些Contract接口])

> 如果"具体实现"是一个类最好是继承这些接口,显得标准点,如果不是就别理会了

```php
/**
 * 首先定义一个接口和一个类,这里省略命名空间
 */
namespace App\Services\Message\Contracts;
interface SendMessage
{
    public function say();
}

namespace App\Services\Message;
class SendMessage implements SendMessageInterface
{
    public function say()
    {
        echo 'Laravel is good!';
    }
}
```

##### 创建提供者

在你的AppServiceProvider或者自定义的Provider中的register方法中这样做

```php
...
use App\Services\Message\Contracts\SendMessage as SendMessageInterface;
class MessageServiceProvider extends ServiceProvider
{
    public function register()
    {
        $this->app->singleton('message.send',SendMessage::class);
        $this->app->alias('message.send',SendMessageInterface::class);
    }
}
```

##### 注册提供者

> 如果你的绑定是放在AppServiceProvider或者其它Laravel应用自动生成的提供者里面则不用管这一步了,因为这些提供者已经注册好了

有两种方法可以绑定注册提供者

1. 可以选择在config/app.php的'providers'数组中加载你的MessageServiceProvider
2. 在AppServiceProvider中的register方法里面用$this->app->register(MessageServiceProvider::class)注册

```php
//config/app.php
...
  'providers' => [
      App\Services\Message\MessageServiceProvider::class,
  ]
```

##### 使用门面

如果你想要个Facades(门面)就文档自己弄一个Facades类就可以了,当然也可以在MessageServiceProvider的boot方法中使用

```php
public function boot()
{
    AliasLoader::getInstance
}
```

> Laravel5.4可以自动让任何类变成门面

你用5.4版本并且你的服务仅仅是一个类的话的话直接可以像这样调用门面,而不需要任何其它附加的注册

```php
 use Facades\ {
    App\Services\Message\SendMessage;
 };
```

##### 解析服务

> 当然也可以使用门面,但是不建议多使用,这东西很废(在blade或twig模板里除外)

在控制器中通过Constract接口注入请求方法

```php
use App\Services\Message\Contracts\SendMessage;
class ArticleController extends Controller
{
    public function create(SendMessage $message)
    {
        $hello->say();
    }
}
```

在控制器中通过构造方法注入Application接口调用或者在构造方法中直接注入Contract接口

```php
  
class ArticleController extends Controller
{
    protected $app;
    public function __(Application $app)
    {
        $this->app = $app;
    }
    public function say()
    {
        $hello = $this->app->make('message.send'); //或者
        $hello = $this->app['message.send'];   //或者
        $hello = app('message.send');
        // 链式写法
        $this->app->make('hmessage.send')->say();
    }
}
```

在其它非控制器类中使用

> 如果SendMessage使用的地方不方便注入Application的话,可以丢弃这个构造函数,直接使用app('message.send')获取服务

```php
/**
 * 在其它非控制器类中使用
 */
  
class CustomClass
{
    public function say(message.send $hello)
    {
        $hello->say();
    }
}
  
class UserSay
{
    protected $app;
    public function __construct(Application $app)
    {
        $this->app = $app;
    }
    public function say()
    {
        $custom = new CustomClass();
        $custom->say($this->app->make('message.send'));
    }
}
```
closure