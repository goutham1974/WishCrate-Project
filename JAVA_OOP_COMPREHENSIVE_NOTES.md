# Java OOP Concepts - Comprehensive Notes & Interview Guide

## 1. METHOD OVERLOADING vs METHOD OVERRIDING

### Key Differences Table

| Aspect | Overloading | Overriding |
|--------|------------|-----------|
| **Classes Required** | 1 class only | 2+ classes (inheritance required) |
| **Inheritance** | Not required | Compulsory |
| **Polymorphism Type** | Compile-time (Static) | Runtime (Dynamic) |
| **Decision Made By** | Java Compiler | JVM |
| **Binding Type** | Static/Early Binding | Dynamic/Late Binding |
| **Method Name** | Same | Same |
| **Parameters** | Must be DIFFERENT | Must be SAME |
| **Return Type** | Can be anything | Must be same or covariant |
| **Access Modifiers** | Can be anything | Same or increase visibility |
| **Static Methods** | Can be overloaded | Cannot be overridden |
| **@Override Annotation** | Not available | Available |
| **Final Keyword** | Allowed | Not allowed |

### Interview Q&A

**Q: What is method overloading?**
A: Method overloading is compile-time polymorphism where multiple methods have the same name but different parameters in the same class.

**Q: What is method overriding?**
A: Method overriding is runtime polymorphism where a child class provides a specific implementation of a method already defined in parent class.

**Q: Can return type differ in method overloading?**
A: Yes, return type doesn't participate in method overloading.

**Q: Can return type differ in method overriding?**
A: No, return type must be same or covariant (subclass type).

**Q: Can static methods be overridden?**
A: No, static methods are class members and cannot be overridden. They can only be hidden.

---

## 2. ABSTRACTION CONCEPTS

### Definition
Abstraction is hiding implementation details and showing only essential functionalities. Purpose: **SECURITY**

### Two Ways to Achieve Abstraction

#### Method 1: Using Abstract Class
```java
abstract class Shape {
    float area;
    
    abstract void acceptInput();
    abstract void calculateArea();
    
    void displayArea() {  // Concrete method
        System.out.println("Area: " + area);
    }
}
```

**Characteristics:**
- Can have both abstract and concrete methods
- **Impure abstraction** (mixes abstract + concrete)
- Requires `abstract` keyword for class
- Cannot be instantiated

#### Method 2: Using Interface (Pure Abstraction)
```java
interface OperatingSystem {
    void boot();
    void shutdown();
}
```

**Characteristics:**
- Only abstract methods allowed
- **Pure abstraction**
- Uses `implements` keyword (not `extends`)
- Cannot be instantiated

### Key Interview Questions

**Q: Can a variable be declared as abstract?**
A: No. Variables cannot be abstract because:
- Instance variables always get default values
- Local variables require initialization
- A variable cannot be incomplete in its lifetime
- Abstract means incomplete, which contradicts value requirement

**Q: Can an abstract class be declared as final?**
A: No. Error: "Class can be either abstract or final, not both"
**Reason:** 
- Final: Inheritance not allowed
- Abstract: Inheritance required (for giving body to abstract methods)
- They're opposite in nature

**Q: Can an abstract method be declared as final?**
A: No.
**Reason:** 
- Final method: Overriding restricted
- Abstract method: Overriding required
- Conflict of interest

**Q: Can a concrete method be in an abstract class?**
A: Yes. Abstract class can have both abstract and concrete methods.

---

## 3. FOUR PILLARS OF OOP - COMPLETE EXAMPLE

### Problem Statement
Calculate area of Square, Rectangle, and Circle with all 4 OOP pillars.

### Step 1: Without OOP (No Pillars)

```java
class Square {
    float side;
    float area;
    
    void acceptInput() {
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter side:");
        side = scan.nextFloat();
    }
    
    void calculateArea() {
        area = side * side;
        // OR: area = (float) Math.pow(side, 2);
    }
    
    void displayArea() {
        System.out.println("Area: " + area);
    }
}

class Rectangle {
    float length, breadth, area;
    
    void acceptInput() {
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter length:");
        length = scan.nextFloat();
        System.out.println("Enter breadth:");
        breadth = scan.nextFloat();
    }
    
    void calculateArea() {
        area = length * breadth;
    }
    
    void displayArea() {
        System.out.println("Area: " + area);
    }
}

class Circle {
    float radius;
    float area;
    
    void acceptInput() {
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter radius:");
        radius = scan.nextFloat();
    }
    
    void calculateArea() {
        area = (float) (Math.PI * radius * radius);
    }
    
    void displayArea() {
        System.out.println("Area: " + area);
    }
}

// Main method - NO PILLARS
public static void main(String[] args) {
    Square s = new Square();
    s.acceptInput();
    s.calculateArea();
    s.displayArea();
    
    Rectangle r = new Rectangle();
    r.acceptInput();
    r.calculateArea();
    r.displayArea();
    
    Circle c = new Circle();
    c.acceptInput();
    c.calculateArea();
    c.displayArea();
}
```

**Problems:**
- Code repetition
- Tight coupling
- No abstraction
- No polymorphism
- No inheritance benefits

---

### Step 2: Adding Pillar 1 & 2 - ENCAPSULATION & INHERITANCE

```java
abstract class Shape {
    protected float area;  // Common member
    
    abstract void acceptInput();
    abstract void calculateArea();
    
    void displayArea() {  // Concrete common method
        System.out.println("Area: " + area);
    }
}

class Square extends Shape {
    private float side;  // ENCAPSULATION: Private member
    
    @Override
    void acceptInput() {
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter side:");
        side = scan.nextFloat();
    }
    
    @Override
    void calculateArea() {
        area = side * side;
    }
}

class Rectangle extends Shape {
    private float length, breadth;  // ENCAPSULATION
    
    @Override
    void acceptInput() {
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter length:");
        length = scan.nextFloat();
        System.out.println("Enter breadth:");
        breadth = scan.nextFloat();
    }
    
    @Override
    void calculateArea() {
        area = length * breadth;
    }
}

class Circle extends Shape {
    private float radius;  // ENCAPSULATION
    
    @Override
    void acceptInput() {
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter radius:");
        radius = scan.nextFloat();
    }
    
    @Override
    void calculateArea() {
        area = (float) (Math.PI * radius * radius);
    }
}

// Main - 2 Pillars achieved
public static void main(String[] args) {
    Square s = new Square();
    s.acceptInput();
    s.calculateArea();
    s.displayArea();
    
    Rectangle r = new Rectangle();
    r.acceptInput();
    r.calculateArea();
    r.displayArea();
    
    Circle c = new Circle();
    c.acceptInput();
    c.calculateArea();
    c.displayArea();
}
```

**Pillars Achieved:**
1. ✅ **ENCAPSULATION**: Private members, protected inheritance
2. ✅ **INHERITANCE**: All shapes extend Shape
3. ❌ **POLYMORPHISM**: Not yet (still tight coupling)
4. ✅ **ABSTRACTION**: Abstract class with abstract methods

---

### Step 3: Adding Pillar 3 - POLYMORPHISM (Loose Coupling)

```java
class Geometry {
    void shapeArea(Shape ref) {  // Parent reference - LOOSE COUPLING
        ref.acceptInput();
        ref.calculateArea();
        ref.displayArea();
    }
}

// Main - 3 Pillars
public static void main(String[] args) {
    Geometry g = new Geometry();
    
    // Polymorphism: Child object with parent reference
    Shape s = new Square();      // Upcasting
    g.shapeArea(s);
    
    Shape r = new Rectangle();   // Upcasting
    g.shapeArea(r);
    
    Shape c = new Circle();      // Upcasting
    g.shapeArea(c);
}
```

**Polymorphism Achieved Because:**
- Method overriding present ✅
- Child object + Parent reference ✅
- Loose coupling ✅
- Runtime binding ✅

---

### Step 4: All 4 Pillars Complete

**All concepts from Step 2 + Step 3**

**Checklist:**
1. ✅ **ENCAPSULATION**: Private members (side, length, breadth, radius), Protected parent member (area), Setters (acceptInput), Getters (displayArea)
2. ✅ **INHERITANCE**: Square, Rectangle, Circle extend Shape
3. ✅ **POLYMORPHISM**: Child objects with parent references in Geometry class
4. ✅ **ABSTRACTION**: Abstract Shape class with abstract methods

---

## 4. INTERFACES - INTRODUCTION

### What is an Interface?
A collection of **pure abstract methods** (only method signatures, no implementation).

### Syntax
```java
interface OperatingSystem {
    void boot();
    void shutdown();
}

class MacOS implements OperatingSystem {
    @Override
    public void boot() {
        // Implementation
    }
    
    @Override
    public void shutdown() {
        // Implementation
    }
}
```

### Abstract Class vs Interface

| Feature | Abstract Class | Interface |
|---------|---|---|
| Abstract methods | ✅ Yes | ✅ Yes |
| Concrete methods | ✅ Yes | ❌ No (pure) |
| Type of Abstraction | Impure | Pure |
| Keyword | `abstract class` | `interface` |
| Implementation | `extends` | `implements` |
| Can have variables | ✅ Yes | ✅ Yes |
| Constructor | ✅ Yes | ❌ No |

### Key Interview Questions on Interfaces

**Q: Can an interface extend another interface?**
A: Yes. `interface B extends A { }`

**Q: Can an interface extend a class?**
A: No. Interfaces extend only interfaces.

**Q: Can a class extend an interface?**
A: No. A class implements an interface, doesn't extend it.

**Q: Can an interface implement another interface?**
A: No. Interfaces implement nothing; they only extend/are implemented.

---

## 5. IMPORTANT INTERVIEW QUESTIONS & ANSWERS

### Q1: Why is multiple inheritance not allowed in Java?
A: To avoid "Diamond Problem" (ambiguity when child inherits from two parents with same method).

### Q2: Can we instantiate an abstract class?
A: No. Abstract classes cannot be instantiated.
Example: `Shape s = new Shape();` ❌ Error

### Q3: What is the difference between abstract class and interface before Java 8?
A: 
- Abstract class: Can have concrete methods
- Interface: Only abstract methods (before Java 8)

*Note: Java 8+ allows default methods in interfaces*

### Q4: Is it mandatory to override all abstract methods?
A: Yes, unless the child class is also abstract.

### Q5: Can we have a class without any abstract method as abstract?
A: Yes, with `abstract class Demo { }` but it cannot be instantiated.

### Q6: What is loose coupling?
A: Using parent reference to point to child object. Makes code flexible to accept any child type.
```java
Shape s = new Square();  // Loose coupling
```

### Q7: What is tight coupling?
A: Using child reference directly.
```java
Square s = new Square();  // Tight coupling
```

### Q8: Explain covariant return types.
A: Child method can return subclass of parent return type.
```java
class Parent {
    Shape getShape() { return new Shape(); }
}
class Child extends Parent {
    Square getShape() { return new Square(); }  // Allowed (Square is-a Shape)
}
```

### Q9: Can we declare a method as final and abstract?
A: No. Final restricts override, abstract requires override.

### Q10: What is JVM and its role in polymorphism?
A: JVM decides at runtime which method to call based on actual object type (late binding).

---

## 6. KEY POINTS TO REMEMBER

### Encapsulation
- Declare data members as `private`
- Provide `public` setter methods (acceptInput)
- Provide `public` getter methods (displayArea)
- **Benefits**: Security, control over data

### Inheritance
- Child extends parent: `class Child extends Parent`
- Child "is-a" parent relationship
- Private members NOT inherited (won't participate in inheritance)
- Protected members inherited

### Abstraction
- Hide implementation, show interface
- Use abstract class or interface
- Abstract methods require body in child class
- At least one abstract method → class must be abstract too

### Polymorphism
- **Conditions**:
  1. Method overriding must exist
  2. Child object with parent reference
  3. Method call resolves at runtime (JVM decides)

### Static Members
- **Cannot be overridden** (can only be hidden)
- **Cannot participate in polymorphism**
- Belong to class, not objects
- Called via `ClassName.staticMember`

### Final Keyword
- On variable: Constant (cannot reassign)
- On method: Cannot override
- On class: Cannot inherit

---

## 7. CODE PROGRESSION SUMMARY

### Before OOP (Main class with 3x code repetition)
```java
Square s = new Square();
s.acceptInput();
s.calculateArea();
s.displayArea();
// Repeat for Rectangle and Circle
```

### After OOP (Single line with polymorphism)
```java
Geometry g = new Geometry();
g.shapeArea(new Square());
g.shapeArea(new Rectangle());
g.shapeArea(new Circle());
```

**Result:** 
- 90% code reduction
- Any new shape can be added without modifying main method
- Flexible and maintainable code

---

## 8. MUST-DO PRACTICE TASK

Create a hierarchy:
```
Bird (interface)
├── eat() - abstract
├── fly() - abstract
│
├── Eagle (abstract class) extends Bird
│   └── fly() - overridden (concrete)
│   └── eat() - abstract still
│
├── SerpentEagle (concrete) extends Eagle
│   └── eat() - concrete (eats snakes)
│   └── fly() - inherited concrete
│
└── GoldenEagle (concrete) extends Eagle
    └── eat() - concrete (eats fishes)
    └── fly() - inherited concrete
```

**Type of Inheritance**: Hybrid (Single + Hierarchical combined)

---

## 9. COMMON MISTAKES TO AVOID

❌ Declaring variables as `private` in parent class (won't be inherited)
✅ Use `protected` for parent class members

❌ Forgetting `@Override` annotation (reduce readability)
✅ Always use `@Override` when overriding

❌ Using child reference instead of parent reference
✅ Use parent reference for polymorphism: `Shape s = new Square();`

❌ Not making class abstract when it has abstract methods
✅ Always make class abstract if it has any abstract method

❌ Trying to instantiate abstract class or interface
✅ Create concrete child class and instantiate that

---

## 10. TIME INVESTMENT NEEDED FOR OOP

- Encapsulation: 4 days
- Static (prerequisite): 2 days  
- Inheritance: 5 days
- Polymorphism: 1 day
- Abstraction: 2 days
- **Total: ~3 weeks**

**Expected Interview Performance**: 
- Should explain all 4 pillars thoroughly: 20-30 minutes minimum
- With proper example and explanation: 1% of candidates achieve this level
