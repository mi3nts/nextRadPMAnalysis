
classdef FigureParam < handle
    properties
        scrsz
        width
        height
        default_left
        default_bottom
        l
        b
        loc
    end
    
    methods
        function obj = FigureParam(screen_size, hor_div, ver_div, left, bottom)
            obj.scrsz = screen_size;
            obj.width = screen_size(3) / hor_div;
            obj.height = screen_size(4) / ver_div;
            obj.default_left = left;
            obj.l = left;
            obj.default_bottom = bottom;
            obj.b = bottom;
            obj.loc = [left, bottom, obj.width, obj.height];
        end
        function obj = refresh(obj)
            if obj.l + obj.width >= obj.scrsz
                obj.b = mod(obj.b + obj.height, obj.scrsz(4));
            end
            obj.l = mod(obj.l + obj.width, obj.scrsz(3));
            obj.loc = [obj.l, obj.b, obj.width, obj.height];
        end
        function obj = reset(obj)
            obj.l = obj.default_left;
            obj.b = obj.default_bottom;
            obj.loc = [obj.l, obj.b, obj.width, obj.height];
        end
    end
end