version "4.10.0"

#include "ZJSON/Include.zs"
#include "ZScript/Include.zs"

class JSONExampleHandler : StaticEventHandler {
	
	ExampleOptions example_data;
	
	override void OnRegister(){
		int lump=Wads.CheckNumForFullName("/Example.json");
		if(lump==-1){
			ThrowAbortException("Example.json: could not find file");
		}
		JsonElementOrError data=JSON.parse(Wads.ReadLump(lump),false);
		if(data is "JsonError"){
			ThrowAbortException("Example.json: "..JsonError(data).what);
		}
		example_data=ExampleOptions.deserialize(JsonElement(data));
		console.printf(example_data.sub_option_2);
	}
}