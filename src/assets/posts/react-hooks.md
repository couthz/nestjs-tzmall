## 内置hooks



### UseState

```typescript
const App: FC = () => {
  const [count, setCount] = useState(0);
  const [isShow, toggleShow] = useState(true);
  return (
    <>
      <p>{count}</p>
      <button onClick={() => setCount(count + 1)}>increment +</button>
      <p>{isShow ? <span> I'm show now </span> : null}</p>
      <button onClick={() => toggleShow(!isShow)}>open sidebar</button>
    </>
  );
};
```



![](https://pic.phpna.com/react-notes/20190920010500.gif)

### UseEffect

函数体用于注册事件,返回值用于注销事件

#### 没有第二个参数

1. 组件挂载(首次渲染)只执行useEffect函数体
2. 组件更新先执行返回值函数,再执行函数体
3. 组件卸载只执行返回值函数

#### 第二个参数为空数组

1. 组件挂载(首次渲染)只执行函数体
2. 组件更新不执行,直接跳过
3. 组件卸载只执行返回值函数

#### 第二个参数为可变值

1. 组件挂载(可变值初始化后)只执行函数体
2. 只当可变值变化先执行返回值函数,再执行函数体
3. 组件卸载只执行返回值函数

![](https://pic.phpna.com/react-notes/20190920023556.png)

示例: 写一个拖动浏览器实时显示窗口宽度的组件,注意不要忘记把这个组件放入`App`组件中

```tsx
const EffectComponent: FC = () => {
  const [width, setWidth] = useState(window.innerWidth);
  const resizeHandle = () => {
    console.log(window.innerWidth);
    setWidth(window.innerWidth);
  };
  useEffect(() => {
    window.addEventListener("resize", resizeHandle);
    return () => {
      window.removeEventListener("resize", resizeHandle);
    };
  }, [width]);
  return (
    <>
      <p>{width}</p>
    </>
  );
};
```

看一下效果

![](https://pic.phpna.com/react-notes/20190920034745.gif)



### useContext

创建演示组件

```tsx
// components/ContextDemo.tsx
...
import { LocalProps, LangType } from "../typing";

const langs: LangType[] = [
  { name: "en", label: "english" },
  { name: "zh-CN", label: "简体中文" }
];

const localContext = createContext(langs[0]);

const LocalContextProvider: FC<LocalProps> = props => {
  const [localLang, setLocalLang] = useState<LangType>(
    !props.lang ? props.lang! : langs[0]
  );
  useEffect(() => {
    setLocalLang(props.lang!);
  }, [props.lang]);
  return (
    <>
      <localContext.Provider value={localLang}>
        {props.children}
      </localContext.Provider>
    </>
  );
};

const LocalSelector: FC<{ setLang: Function }> = props => {
  const currentLang = useContext(localContext);
  const changeCurrentLang = (event: ChangeEvent<HTMLSelectElement>) => {
    props.setLang(langs.find(lang => lang.name === event.target.value));
  };
  return (
    <>
      <select name="LocalSelector" onChange={changeCurrentLang}>
        {langs.map(lang => (
          <option
            value={lang.name}
            key={lang.name}
            selected={lang.name === currentLang.name}
          >
            {lang.label ? lang.label : lang.name}
          </option>
        ))}
      </select>
    </>
  );
};

const contextDemo = {
  langs,
  localContext,
  LocalContextProvider,
  LocalSelector
};
export default contextDemo;

```

在根组件导入组件

```tsx
// index.tsx
...
const App: FC = () => {
  const [lang, setLang] = useState(langs[0]);
  return (
    <ContextDemo.LocalContextProvider lang={lang}>
      ...
      <h2>useContext Demo</h2>
      <ContextDemo.LocalSelector setLang={(lang: LangType) => setLang(lang)} />
    </ContextDemo.LocalContextProvider>
  );
};

```

在`EffectDemo`组件使用`useContext`显示当前语言

```tsx
...
const currentLang = useContext(ContextDemo.localContext);
<p>
    current lang is{" "}
    {currentLang.label ? currentLang.label! : currentLang.name}
</p>
```

看一下效果

![](https://pic.phpna.com/react-notes/20190922195237.gif)



### useReducer

```tsx
// components/ReducerDemo.tsx
...
// 初始化时默认主题名称
const defaultThemeName: string = "dark";

// 主题列表
const themes: ThemeType[] = [
  { name: "dark", label: "暗黑" },
  { name: "light", label: "明亮" }
];

// 过滤主题列表(删除非默认主题的isDefault属性)
const filterThemes = (data: ThemeType[]) =>
  data.map(theme => {
    if (theme.isDefault !== undefined && !theme.isDefault) {
      delete theme.isDefault;
    }
    return theme;
  });

// 获取初始化主题列表(设置初始化默认主题为当前默认主题),此函数用于初始化reducer的值
const getInitThemes = (data: ThemeType[]) => {
  return filterThemes(
    data.map(theme => {
      theme.isDefault = theme.name === defaultThemeName;
      return theme;
    })
  );
};

// 主题操作,为了便于演示这里我们只添加了一个切换默认主题的操作
const ThemeReducer = (state: ThemeType[], action: ThemeActionType) => {
  switch (action.type) {
    case "CHANGE_THEME":
      return filterThemes(
        state.map(theme => {
          if (theme.name === action.value.name) {
            return { ...theme, isDefault: true };
          }
          return { ...theme, isDefault: false };
        })
      );
    default:
      return filterThemes(state);
  }
};

// 获取默认当前主题
const getDefaultTheme = (data: ThemeType[]) =>
  filterThemes(data).find(theme => theme.isDefault!);

// 创建主题列表的全局变量
const themesContext = createContext<
  [ThemeType[], Dispatch<ThemeActionType>] | null
>(null);

// 创建当前默认主题的全局变量
const defaultThemeContext = createContext(
  getInitThemes(themes).find(theme => theme.name === defaultThemeName)
);

// 创建一个Provider高阶组件
const ThemeContextProvider: FC<{
  children: ReactElement[] | ReactElement;
}> = props => {
  // 把{主题列表状态,触发状态改变的dispatch}包装为全局变量
  const contextValue = useReducer(ThemeReducer, themes, getInitThemes);
  // 根据主题列表状态的变化使用getDefaultTheme动态的获取当前默认主题
  const [currentThemes] = contextValue;
  return (
    <>
      <themesContext.Provider value={contextValue}>
        <defaultThemeContext.Provider value={getDefaultTheme(currentThemes)!}>
          {props.children}
        </defaultThemeContext.Provider>
      </themesContext.Provider>
    </>
  );
};

// 自定义一个hooks用于其它组件便捷地通过themesContext全局变量来获取主题列表的state和dispatch
const useThemesReducer = () => {
  const contextValue = useContext(themesContext);
  return contextValue;
};

// 自定义一个Hooks通过全局变量defaultThemeContext来快捷地获取当前默认主题
const useTheme = (): ThemeType => {
  const contextValue = useContext(defaultThemeContext);
  return contextValue!;
};

// 根据主题对象获取主题的显示名
const getThemeText = (theme: ThemeType): string => {
  return theme.label ? theme.label : theme.name;
};

// 主题选择器组件
const ThemeSelector: FC = () => {
  const [themes, dispatch] = useThemesReducer()!;
  const defaultTheme = useTheme();
  const changeDefaultTheme = (event: ChangeEvent<HTMLSelectElement>) => {
    dispatch({
      type: ThemeActionName.CHANGE_THEME,
      value: themes.find(theme => theme.name === event.target.value)!
    });
  };
  return (
    <>
      <p>{defaultTheme.name}</p>
      <select name="LocalSelector" onChange={changeDefaultTheme}>
        {themes.map(theme => (
          <option value={theme.name} key={theme.name}>
            {theme.label ? theme.label : theme.name}-
          </option>
        ))}
      </select>
    </>
  );
};

export default {
  useTheme,
  useThemesReducer,
  getThemeText,
  ThemeContextProvider,
  ThemeSelector
};
```

```tsx
// index.tsx
<ReducerDemo.ThemeContextProvider>
  ...
  <ReducerDemo.ThemeSelector />
</ReducerDemo.ThemeContextProvider>
```

在`EffectDemo`组件测试当前默认主题切换

```tsx
...
<p>current theme is {ReducerDemo.getThemeText(currentTheme)}</p>
```

![](https://pic.phpna.com/react-notes/20190923005620.gif)
