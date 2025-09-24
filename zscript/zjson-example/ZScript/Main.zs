class ExampleOptions {
	Array<ExampleSubOption1> sub_option_1;
	String sub_option_2;
	
	private ExampleOptions _deserialize(JsonObject obj){
		JsonElement so_1_elem=obj.get("sub_option_1");
		if(so_1_elem){
			JsonArray so_1_arr=JsonArray(so_1_elem);
			if(!so_1_arr){
				ThrowAbortException("In ExampleOptions expected 'sub_option_1' to be a JsonArray, got a "..so_1_elem.getClassName());
			}
			uint n=so_1_arr.size();
			for(uint i=0;i<n;i++){
				sub_option_1.push(ExampleSubOption1.deserialize(so_1_arr.get(i)));
			}
		}
		JsonElement so_2_elem=obj.get("sub_option_2");
		if(so_2_elem){
			JsonString so_2_str=JsonString(so_2_elem);
			if(!so_2_str){
				ThrowAbortException("In ExampleOptions expected 'sub_option_2' to be a JsonString, got a "..so_2_elem.getClassName());
			}
			sub_option_2=so_2_str.s;
		}
		return self;
	}
	
	static ExampleOptions deserialize(JsonElement elem){
		if(!elem){
			ThrowAbortException("In ExampleOptions expected a JsonObject, got null");
		}
		JsonObject obj=JsonObject(elem);
		if(!obj){
			ThrowAbortException("In ExampleOptions expected a JsonObject, got a "..elem.getClassName());
		}
		return new("ExampleOptions")._deserialize(obj);
	}
}

class ExampleSubOption1 {
	String type;
	int count;
	Array<ExampleSubOption1> sub;
	
	private ExampleSubOption1 _deserialize(JsonObject obj){
		JsonElement type_elem=obj.get("type");
		if(!type_elem){
			ThrowAbortException("In ExampleSubOption1 expected 'type', was missing");
		}
		JsonString type_str=JsonString(type_elem);
		if(!type_str){
			ThrowAbortException("In ExampleSubOption1 expected 'type' to be a JsonString, got a "..type_elem.getClassName());
		}
		type=type_str.s;
		JsonElement count_elem=obj.get("count");
		if(!count_elem){
			ThrowAbortException("In ExampleSubOption1 expected 'count', was missing");
		}
		JsonInt count_int=JsonInt(count_elem);
		if(!count_int){
			ThrowAbortException("In ExampleSubOption1 expected 'count' to be a JsonInt, got a "..count_elem.getClassName());
		}
		count=count_int.i;
		JsonElement so_1_elem=obj.get("sub");
		if(so_1_elem){
			JsonArray so_1_arr=JsonArray(so_1_elem);
			if(!so_1_arr){
				ThrowAbortException("In ExampleSubOption1 expected 'sub' to be a JsonArray, got a "..so_1_elem.getClassName());
			}
			uint n=so_1_arr.size();
			for(uint i=0;i<n;i++){
				sub.push(ExampleSubOption1.deserialize(so_1_arr.get(i)));
			}
		}
		return self;
	}
	
	static ExampleSubOption1 deserialize(JsonElement elem){
		if(!elem){
			ThrowAbortException("In ExampleSubOption1 expected a JsonObject, got null");
		}
		JsonObject obj=JsonObject(elem);
		if(!obj){
			ThrowAbortException("In ExampleSubOption1 expected a JsonObject, got a "..elem.getClassName());
		}
		return new("ExampleSubOption1")._deserialize(obj);
		
	}
}