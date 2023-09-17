console.log("");

class Foo {
  private bar: number;

  constructor() {
    this.bar = 1;
  }

  public getBar(): number {
    return this.bar;
  }
}

const foo = new Foo();
foo.getBar();

console.log("XXXXXX");
