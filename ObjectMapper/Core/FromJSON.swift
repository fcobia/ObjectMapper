//
//  FromJSON.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2014-10-09.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2014-2015 Hearst
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

internal final class FromJSON {
	
	/// Basic type
	class func basicType<FieldType>(_ field: inout FieldType, object: FieldType?) {
		if let value = object {
			field = value
		}
	}
	
	/// optional basic type
	class func optionalBasicType<FieldType>(_ field: inout FieldType?, object: FieldType?) {
		field = object
	}
	
	/// Implicitly unwrapped optional basic type
	class func optionalBasicType<FieldType>(_ field: inout FieldType!, object: FieldType?) {
		field = object
	}
	
	/// Mappable object
	class func object<N: Mappable>(_ field: inout N, map: Map) {
		if map.toObject {
			_ = Mapper(context: map.context).map(map.currentValue, toObject: field)
		} else if let value: N = Mapper(context: map.context).map(map.currentValue) {
			field = value
		}
	}
	
	/// Optional Mappable Object
	class func optionalObject<N: Mappable>(_ field: inout N?, map: Map) {
		if let field = field where map.toObject && map.currentValue != nil {
			_ = Mapper(context: map.context).map(map.currentValue, toObject: field)
		} else {
			field = Mapper(context: map.context).map(map.currentValue)
		}
	}
	
	/// Implicitly unwrapped Optional Mappable Object
	class func optionalObject<N: Mappable>(_ field: inout N!, map: Map) {
		if let field = field where map.toObject && map.currentValue != nil {
			_ = Mapper(context: map.context).map(map.currentValue, toObject: field)
		} else {
			field = Mapper(context: map.context).map(map.currentValue)
		}
	}
	
	/// mappable object array
	class func objectArray<N: Mappable>(_ field: inout Array<N>, map: Map) {
		if let objects = Mapper<N>(context: map.context).mapArray(map.currentValue) {
			field = objects
		}
	}
	
	/// optional mappable object array
	class func optionalObjectArray<N: Mappable>(_ field: inout Array<N>?, map: Map) {
		if let objects: Array<N> = Mapper(context: map.context).mapArray(map.currentValue) {
			field = objects
		} else {
			field = nil
		}
	}
	
	/// Implicitly unwrapped optional mappable object array
	class func optionalObjectArray<N: Mappable>(_ field: inout Array<N>!, map: Map) {
		if let objects: Array<N> = Mapper(context: map.context).mapArray(map.currentValue) {
			field = objects
		} else {
			field = nil
		}
	}
	
	/// mappable object array
	class func twoDimensionalObjectArray<N: Mappable>(_ field: inout Array<Array<N>>, map: Map) {
		if let objects = Mapper<N>(context: map.context).mapArrayOfArrays(map.currentValue) {
			field = objects
		}
	}
	
	/// optional mappable 2 dimentional object array
	class func optionalTwoDimensionalObjectArray<N: Mappable>(_ field: inout Array<Array<N>>?, map: Map) {
		field = Mapper(context: map.context).mapArrayOfArrays(map.currentValue)
	}
	
	/// Implicitly unwrapped optional 2 dimentional mappable object array
	class func optionalTwoDimensionalObjectArray<N: Mappable>(_ field: inout Array<Array<N>>!, map: Map) {
		field = Mapper(context: map.context).mapArrayOfArrays(map.currentValue)
	}
	
	/// Dctionary containing Mappable objects
	class func objectDictionary<N: Mappable>(_ field: inout Dictionary<String, N>, map: Map) {
		if map.toObject {
			_ = Mapper<N>(context: map.context).mapDictionary(map.currentValue, toDictionary: field)
		} else {
			if let objects = Mapper<N>(context: map.context).mapDictionary(map.currentValue) {
				field = objects
			}
		}
	}
	
	/// Optional dictionary containing Mappable objects
	class func optionalObjectDictionary<N: Mappable>(_ field: inout Dictionary<String, N>?, map: Map) {
		if let field = field where map.toObject && map.currentValue != nil {
			_ = Mapper(context: map.context).mapDictionary(map.currentValue, toDictionary: field)
		} else {
			field = Mapper(context: map.context).mapDictionary(map.currentValue)
		}
	}
	
	/// Implicitly unwrapped Dictionary containing Mappable objects
	class func optionalObjectDictionary<N: Mappable>(_ field: inout Dictionary<String, N>!, map: Map) {
		if let field = field where map.toObject && map.currentValue != nil {
			_ = Mapper(context: map.context).mapDictionary(map.currentValue, toDictionary: field)
		} else {
			field = Mapper(context: map.context).mapDictionary(map.currentValue)
		}
	}
	
	/// Dictionary containing Array of Mappable objects
	class func objectDictionaryOfArrays<N: Mappable>(_ field: inout Dictionary<String, [N]>, map: Map) {
		if let objects = Mapper<N>(context: map.context).mapDictionaryOfArrays(map.currentValue) {
			field = objects
		}
	}
	
	/// Optional Dictionary containing Array of Mappable objects
	class func optionalObjectDictionaryOfArrays<N: Mappable>(_ field: inout Dictionary<String, [N]>?, map: Map) {
		field = Mapper<N>(context: map.context).mapDictionaryOfArrays(map.currentValue)
	}
	
	/// Implicitly unwrapped Dictionary containing Array of Mappable objects
	class func optionalObjectDictionaryOfArrays<N: Mappable>(_ field: inout Dictionary<String, [N]>!, map: Map) {
		field = Mapper<N>(context: map.context).mapDictionaryOfArrays(map.currentValue)
	}
	
	/// mappable object Set
	class func objectSet<N: Mappable>(_ field: inout Set<N>, map: Map) {
		if let objects = Mapper<N>(context: map.context).mapSet(map.currentValue) {
			field = objects
		}
	}
	
	/// optional mappable object array
	class func optionalObjectSet<N: Mappable>(_ field: inout Set<N>?, map: Map) {
		field = Mapper(context: map.context).mapSet(map.currentValue)
	}
	
	/// Implicitly unwrapped optional mappable object array
	class func optionalObjectSet<N: Mappable>(_ field: inout Set<N>!, map: Map) {
		field = Mapper(context: map.context).mapSet(map.currentValue)
	}
	
}
