package uk.co.ultravisual.asparticles;
class DynamicMap {

    private var map = {};
    private var _keys = [];
    private var _values = [];

    public function new() {
    }

    public function set(key:Dynamic, value:Dynamic):Void {
        _keys.push(key);
        _values.push(value);
        Reflect.setField(map, key, value);
    }

    public function get(key:Dynamic):Dynamic {
        return Reflect.getProperty(map, key);
    }

    public function keys():Iterator<Dynamic> {
        return _keys.iterator();
    }

    public function iterator():Iterator<Dynamic> {
        return _values.iterator();
    }

    public function remove(key:Dynamic):Void {
        var value = get(key);
        removeKey(key);
        removeValue(Reflect.getProperty(value, key));
    }

    private function removeKey(key:Dynamic):Void {
        var position = _keys.indexOf(key);
        if(position > -1) _keys.splice(position, 1);
    }

    private function removeValue(value:Dynamic):Void {
        var position = _values.indexOf(value);
        if(position > -1) _values.splice(position, 1);

    }

}