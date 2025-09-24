class JsonElementOrError {}

class JsonElement : JsonElementOrError abstract
{
	abstract string Serialize();
	abstract string GetPrettyName();
}

class JsonNumber : JsonElement abstract
{
	abstract JsonNumber Negate();
	abstract double  asDouble();
	abstract int asInt();
	
	override string GetPrettyName()
	{
		return "Number";
	}
}

class JsonInt : JsonNumber
{
	int i;
	
	static JsonInt make(int i = 0)
	{
		let elem = new("JsonInt");
		elem.i = i;
		return elem;
	}
	override JsonNumber Negate()
	{
		i = -i;
		return self;
	}
	override string Serialize()
	{
		return ""..i;
	}
	
	override double asDouble()
	{
		return double(i);
	}
	
	override int asInt()
	{
		return i;
	}
}

class JsonDouble : JsonNumber
{
	double d;
	
	static JsonDouble Make(double d = 0)
	{
		JsonDouble elem = new("JsonDouble");
		elem.d = d;
		return elem;
	}
	override JsonNumber Negate()
	{
		d = -d;
		return self;
	}
	override string Serialize()
	{
		return ""..d;
	}
	
	override double asDouble()
	{
		return d;
	}
	
	override int asInt()
	{
		return int(d);
	}
}

class JsonBool : JsonElement
{
	bool b;
	
	static JsonBool Make(bool b = false)
	{
		JsonBool elem = new("JsonBool");
		elem.b = b;
		return elem;
	}
	
	override string Serialize()
	{
		return b? "true" : "false";
	}
	
	override string GetPrettyName()
	{
		return "Bool";
	}
}

class JsonString : JsonElement
{
	string s;
	
	static JsonString make(string s = "")
	{
		JsonString elem = new("JsonString");
		elem.s=s;
		return elem;
	}
	
	override string Serialize()
	{
		return JSON.serialize_string(s);
	}
	
	override string GetPrettyName()
	{
		return "String";
	}
}

class JsonNull : JsonElement
{
	static JsonNull Make()
	{
		return new("JsonNull");
	}
	
	override string Serialize()
	{
		return "null";
	}
	
	override string GetPrettyName()
	{
		return "Null";
	}
}

class JsonError : JsonElementOrError
{
	String what;
	
	static JsonError make(string s)
	{
		JsonError err = new("JsonError");
		err.what = s;
		return err;
	}
}