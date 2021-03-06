/*:
 
 ## 对比：
 
 ### 相同点
 
 * 定义属性存储值
 * 定义方法提供功能
 * 定义下标脚本，允许使用下标语法访问值
 * 定义初始化器进行初始化
 * 添加扩展
 * 遵守协议
 
 ### 不同点
 
 * class允许继承
 * class可以在运行时的类型转换（is，as）
 * class有反初始化器（deinit）。反初始化器会在实例被释放之前自动被调用。你不能自行调用反初始化器。父类的反初始化器可以被子类继承，并且子类的反初始化器实现结束之后父类的反初始化器会被调用。父类的反初始化器总会被调用，就算子类没有反初始化器。
 * 静态方法修饰（Class static）
 * struct修改属性的方法需要用mutaing修饰
 * struct、enum值类型，class引用类型。Swift 中所有的基本类型——整数，浮点数，布尔量，字符串，数组和字典——都是值类型，并且都以结构体的形式在后台实现。
 * struct有默认的成员初始化器，class没有
 
 ## 特征运算符
 
 * 相同于（===）两个类类型常量或者变量引用自相同的实例
 * 不同于（!==）
 * 等于  （==）两个实例的在值上被视作“相等”或者“等价”
 
 ## 选择
 
 * 结构体的主要目的是为了封装一些相关的简单数据值；
 * 当你在赋予或者传递结构实例时，有理由需要封装的数据值被拷贝而不是引用；
 * 任何存储在结构体中的属性是值类型，也将被拷贝而不是被引用；
 * 结构体不需要从一个已存在类型继承属性或者行为。
 
 */

//: [Contents](Contents) | [Previous](@previous) | [Next](@next)
