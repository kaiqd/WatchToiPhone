@Model
public final class Person {
    @Attribute var name: String
    @Attribute var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}