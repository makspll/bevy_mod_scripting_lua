

global record CoreBevyAPI
    
    
    record LuaWorld

        userdata
    
    --Represents the bevy world all scripts live in.
        --
        --Provides ways to interact with and modify the world.
        --
        --

        --Retrieves type information given either a short (`MyType`) or fully qualified rust type name (`MyModule::MyType`).
        --
        --Returns `nil` if no such type exists or if one wasn't registered on the rust side.
        --
        --
        --
        --
        --This is used extensively in [`LuaWorld`]

        get_type_by_name : function(self:LuaWorld , string):(LuaTypeRegistration)

        --Inserts a component of the given type to the given entity by instantiating a default version of it.
        --
        --The component can then be modified using field access.

        add_default_component : function(self:LuaWorld , LuaEntity , LuaTypeRegistration):(ReflectedValue)

        --Retrieves a component of the given type from the given entity.
        --
        --If such a component does not exist returns `nil`.

        get_component : function(self:LuaWorld , LuaEntity , LuaTypeRegistration):(ReflectedValue)

        --Returns `true` if the given entity contains a component of the given type.

        has_component : function(self:LuaWorld , LuaEntity , LuaTypeRegistration):(boolean)

        --Retrieves a resource of the given type from the world.
        --
        --If such a resource does not exist returns `nil`.

        get_resource : function(self:LuaWorld , LuaTypeRegistration):(ReflectedValue)

        --Removes the given resource from the world, if one doesn't exist it does nothing.

        remove_resource : function(self:LuaWorld , LuaTypeRegistration)

        --Returns `true` if the world contains a resource of the given type.

        has_resource : function(self:LuaWorld , LuaTypeRegistration):(boolean)

        --Retrieves children entities of the parent entity if it has any.

        get_children : function(self:LuaWorld , LuaEntity):({LuaEntity})

        --Retrieves the parent entity of the given entity if it has any.

        get_parent : function(self:LuaWorld , LuaEntity):(LuaEntity)

        --Attaches children entities to the given parent entity.

        push_children : function(self:LuaWorld , LuaEntity , {LuaEntity})

        --Removes children entities from the given parent entity.

        remove_children : function(self:LuaWorld , LuaEntity , {LuaEntity})

        --Removes child entity from the given parent entity.

        remove_child : function(self:LuaWorld , LuaEntity , LuaEntity)

        --Inserts children entities to the given parent entity at the given index.

        insert_children : function(self:LuaWorld , LuaEntity , integer , {LuaEntity})

        --Inserts child entity to the given parent entity at the given index.

        insert_child : function(self:LuaWorld , LuaEntity , integer , LuaEntity)

        --Despawns the given entity's children recursively

        despawn_children_recursive : function(self:LuaWorld , LuaEntity)

        --Despawns the given entity and the entity's children recursively

        despawn_recursive : function(self:LuaWorld , LuaEntity)

        --Spawns a new entity and returns its Entity ID

        spawn : function(self:LuaWorld):(LuaEntity)

        --Despawns the given entity if it exists, returns true if deletion was successfull

        despawn : function(self:LuaWorld , LuaEntity):(boolean)

        --Creates a LuaQueryBuilder, querying for the passed components types.
        --
        --Can be iterated over using `LuaQueryBuilder:iter()`

        query : function(self:LuaWorld , ...:LuaTypeRegistration):(LuaQueryBuilder)

        --Removes the given component from the given entity, does nothing if it doesn't exist on the entity.

        remove_component : function(self:LuaWorld , LuaEntity , LuaTypeRegistration)

        --Attaches child entity to the given parent entity.

        push_child : function(self:LuaWorld , LuaEntity , LuaEntity)

        __tostring : function(self:LuaWorld):(string)

    end
    
    
    record ClassLuaWorld

        userdata
    
    --Collection of static methods for [``].

    end
    
    
    record LuaScriptData

        userdata
    
    --

        --The unique ID of this script

        sid : integer

        __tostring : function(self:LuaScriptData):(string)

    end
    
    
    record ClassLuaScriptData

        userdata
    
    --Collection of static methods for [``].

    end
    
    
    record LuaTypeRegistration

        userdata
    
    --An object representing an existing and registered rust type.
        --
        --Can be obtained via [`LuaWorld::get_type_by_name`].
        --
        --

        --The [short name](https://docs.rs/bevy/latest/bevy/reflect/struct.TypeRegistration.html#method.get_short_name) of a type

        short_name : string

        --The full name of the type

        type_name : string

    end
    
    
    record LuaVec

        userdata
    
    --A reference to the Vec<T> Rust type.
        --
        --All indexing begins at 1.
        --
        --

        to_table : function(self:LuaVec):({any : any})

        push : function(self:LuaVec , any)

        pop : function(self:LuaVec):(any)

        clear : function(self:LuaVec)

        insert : function(self:LuaVec , integer , any)

        remove : function(self:LuaVec , integer):(any)

        __tostring : function(self:LuaVec):(string)

        __index : function(self:LuaVec , integer):(ReflectedValue)

        __pairs : function(self:LuaVec):(function():(any , any))

        __len : function(self:LuaVec):(integer)

        __newindex : function(self:LuaVec , integer , any)

    end
    
    
    record LuaQueryBuilder

        userdata
    
    --

        --A Builder object which allows for filtering and iterating over components and entities in the world.
        --
        --Filters out entities without any of the components passed

        with : function(self:LuaQueryBuilder , ...:LuaTypeRegistration):(LuaQueryBuilder)

        --Filters out entities with any components passed

        without : function(self:LuaQueryBuilder , ...:LuaTypeRegistration):(LuaQueryBuilder)

        --Queries the world and returns an iterator over the entity and components.

        iter : function(self:LuaQueryBuilder):(function():(LuaEntity , ReflectedValue...))

    end
    
    
    record LuaEntity

        userdata
    
    --

        to_bits : function(self:LuaEntity):(integer)

        index : function(self:LuaEntity):(integer)

        generation : function(self:LuaEntity):(integer)

        clone : function(self:LuaEntity):(LuaEntity)

        from_raw : function(integer):(LuaEntity)

        from_bits : function(integer):(LuaEntity)

        __tostring : function(self:LuaEntity):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaEntity

        userdata
    
    --Collection of static methods for [``].

        from_raw : function(integer):(LuaEntity)

        from_bits : function(integer):(LuaEntity)

        __eq : function(any , any):(any)

    end
    
    
    record LuaOnAdd

        userdata
    
    --

    end
    
    
    record LuaOnInsert

        userdata
    
    --

    end
    
    
    record LuaOnRemove

        userdata
    
    --

    end
    
    
    record LuaComponentId

        userdata
    
    --

        index : function(self:LuaComponentId):(integer)

        clone : function(self:LuaComponentId):(LuaComponentId)

        assert_receiver_is_total_eq : function(self:LuaComponentId)

        new : function(integer):(LuaComponentId)

        __tostring : function(self:LuaComponentId):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaComponentId

        userdata
    
    --Collection of static methods for [``].

        new : function(integer):(LuaComponentId)

        __eq : function(any , any):(any)

    end
    
    
    record LuaTick

        userdata
    
    --

        clone : function(self:LuaTick):(LuaTick)

        get : function(self:LuaTick):(integer)

        is_newer_than : function(self:LuaTick , LuaTick , LuaTick):(boolean)

        assert_receiver_is_total_eq : function(self:LuaTick)

        set : function(self:LuaTick , integer)

        new : function(integer):(LuaTick)

        __tostring : function(self:LuaTick):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaTick

        userdata
    
    --Collection of static methods for [``].

        new : function(integer):(LuaTick)

        __eq : function(any , any):(any)

    end
    
    
    record LuaComponentTicks

        userdata
    
    --

        clone : function(self:LuaComponentTicks):(LuaComponentTicks)

        is_added : function(self:LuaComponentTicks , LuaTick , LuaTick):(boolean)

        is_changed : function(self:LuaComponentTicks , LuaTick , LuaTick):(boolean)

        last_changed_tick : function(self:LuaComponentTicks):(LuaTick)

        added_tick : function(self:LuaComponentTicks):(LuaTick)

        set_changed : function(self:LuaComponentTicks , LuaTick)

        __tostring : function(self:LuaComponentTicks):(string)

    end
    
    
    record LuaIdentifier

        userdata
    
    --

        clone : function(self:LuaIdentifier):(LuaIdentifier)

        low : function(self:LuaIdentifier):(integer)

        masked_high : function(self:LuaIdentifier):(integer)

        to_bits : function(self:LuaIdentifier):(integer)

        from_bits : function(integer):(LuaIdentifier)

        __tostring : function(self:LuaIdentifier):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaIdentifier

        userdata
    
    --Collection of static methods for [``].

        from_bits : function(integer):(LuaIdentifier)

        __eq : function(any , any):(any)

    end
    
    
    record LuaEntityHash

        userdata
    
    --

        clone : function(self:LuaEntityHash):(LuaEntityHash)

    end
    
    
    record LuaGlobalTransform

        userdata
    
    --

        clone : function(self:LuaGlobalTransform):(LuaGlobalTransform)

        compute_matrix : function(self:LuaGlobalTransform):(LuaMat4)

        affine : function(self:LuaGlobalTransform):(LuaAffine3A)

        compute_transform : function(self:LuaGlobalTransform):(LuaTransform)

        reparented_to : function(self:LuaGlobalTransform , LuaGlobalTransform):(LuaTransform)

        right : function(self:LuaGlobalTransform):(LuaDir3)

        left : function(self:LuaGlobalTransform):(LuaDir3)

        up : function(self:LuaGlobalTransform):(LuaDir3)

        down : function(self:LuaGlobalTransform):(LuaDir3)

        back : function(self:LuaGlobalTransform):(LuaDir3)

        forward : function(self:LuaGlobalTransform):(LuaDir3)

        translation : function(self:LuaGlobalTransform):(LuaVec3)

        translation_vec3a : function(self:LuaGlobalTransform):(LuaVec3A)

        radius_vec3a : function(self:LuaGlobalTransform , LuaVec3A):(number)

        transform_point : function(self:LuaGlobalTransform , LuaVec3):(LuaVec3)

        mul_transform : function(self:LuaGlobalTransform , LuaTransform):(LuaGlobalTransform)

        from_xyz : function(number , number , number):(LuaGlobalTransform)

        from_translation : function(LuaVec3):(LuaGlobalTransform)

        from_rotation : function(LuaQuat):(LuaGlobalTransform)

        from_scale : function(LuaVec3):(LuaGlobalTransform)

        __tostring : function(self:LuaGlobalTransform):(string)

        __mul : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaGlobalTransform

        userdata
    
    --Collection of static methods for [``].

        from_xyz : function(number , number , number):(LuaGlobalTransform)

        from_translation : function(LuaVec3):(LuaGlobalTransform)

        from_rotation : function(LuaQuat):(LuaGlobalTransform)

        from_scale : function(LuaVec3):(LuaGlobalTransform)

        __mul : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record LuaTransform

        userdata
    
    --

        translation : LuaVec3

        rotation : LuaQuat

        scale : LuaVec3

        translation : LuaVec3

        rotation : LuaQuat

        scale : LuaVec3

        clone : function(self:LuaTransform):(LuaTransform)

        with_translation : function(self:LuaTransform , LuaVec3):(LuaTransform)

        with_rotation : function(self:LuaTransform , LuaQuat):(LuaTransform)

        with_scale : function(self:LuaTransform , LuaVec3):(LuaTransform)

        compute_matrix : function(self:LuaTransform):(LuaMat4)

        compute_affine : function(self:LuaTransform):(LuaAffine3A)

        local_x : function(self:LuaTransform):(LuaDir3)

        left : function(self:LuaTransform):(LuaDir3)

        right : function(self:LuaTransform):(LuaDir3)

        local_y : function(self:LuaTransform):(LuaDir3)

        up : function(self:LuaTransform):(LuaDir3)

        down : function(self:LuaTransform):(LuaDir3)

        local_z : function(self:LuaTransform):(LuaDir3)

        forward : function(self:LuaTransform):(LuaDir3)

        back : function(self:LuaTransform):(LuaDir3)

        mul_transform : function(self:LuaTransform , LuaTransform):(LuaTransform)

        transform_point : function(self:LuaTransform , LuaVec3):(LuaVec3)

        is_finite : function(self:LuaTransform):(boolean)

        rotate : function(self:LuaTransform , LuaQuat)

        rotate_axis : function(self:LuaTransform , LuaDir3 , number)

        rotate_x : function(self:LuaTransform , number)

        rotate_y : function(self:LuaTransform , number)

        rotate_z : function(self:LuaTransform , number)

        rotate_local : function(self:LuaTransform , LuaQuat)

        rotate_local_axis : function(self:LuaTransform , LuaDir3 , number)

        rotate_local_x : function(self:LuaTransform , number)

        rotate_local_y : function(self:LuaTransform , number)

        rotate_local_z : function(self:LuaTransform , number)

        translate_around : function(self:LuaTransform , LuaVec3 , LuaQuat)

        rotate_around : function(self:LuaTransform , LuaVec3 , LuaQuat)

        from_xyz : function(number , number , number):(LuaTransform)

        from_matrix : function(LuaMat4):(LuaTransform)

        from_translation : function(LuaVec3):(LuaTransform)

        from_rotation : function(LuaQuat):(LuaTransform)

        from_scale : function(LuaVec3):(LuaTransform)

        __tostring : function(self:LuaTransform):(string)

        __mul : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaTransform

        userdata
    
    --Collection of static methods for [``].

        from_xyz : function(number , number , number):(LuaTransform)

        from_matrix : function(LuaMat4):(LuaTransform)

        from_translation : function(LuaVec3):(LuaTransform)

        from_rotation : function(LuaQuat):(LuaTransform)

        from_scale : function(LuaVec3):(LuaTransform)

        __mul : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record LuaCompassOctant

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaCompassOctant)

        clone : function(self:LuaCompassOctant):(LuaCompassOctant)

        __tostring : function(self:LuaCompassOctant):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaCompassQuadrant

        userdata
    
    --

        clone : function(self:LuaCompassQuadrant):(LuaCompassQuadrant)

        assert_receiver_is_total_eq : function(self:LuaCompassQuadrant)

        __tostring : function(self:LuaCompassQuadrant):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaAspectRatio

        userdata
    
    --

        clone : function(self:LuaAspectRatio):(LuaAspectRatio)

        new : function(number , number):(LuaAspectRatio)

        from_pixels : function(integer , integer):(LuaAspectRatio)

        __tostring : function(self:LuaAspectRatio):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaAspectRatio

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number):(LuaAspectRatio)

        from_pixels : function(integer , integer):(LuaAspectRatio)

        __eq : function(any , any):(any)

    end
    
    
    record LuaRay2d

        userdata
    
    --

        origin : LuaVec2

        direction : LuaDir2

        origin : LuaVec2

        direction : LuaDir2

        get_point : function(self:LuaRay2d , number):(LuaVec2)

        intersect_plane : function(self:LuaRay2d , LuaVec2 , LuaPlane2d):(number)

        clone : function(self:LuaRay2d):(LuaRay2d)

        new : function(LuaVec2 , LuaVec2):(LuaRay2d)

        __tostring : function(self:LuaRay2d):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaRay2d

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaVec2 , LuaVec2):(LuaRay2d)

        __eq : function(any , any):(any)

    end
    
    
    record LuaRay3d

        userdata
    
    --

        origin : LuaVec3

        direction : LuaDir3

        origin : LuaVec3

        direction : LuaDir3

        clone : function(self:LuaRay3d):(LuaRay3d)

        get_point : function(self:LuaRay3d , number):(LuaVec3)

        intersect_plane : function(self:LuaRay3d , LuaVec3 , LuaInfinitePlane3d):(number)

        new : function(LuaVec3 , LuaVec3):(LuaRay3d)

        __tostring : function(self:LuaRay3d):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaRay3d

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaVec3 , LuaVec3):(LuaRay3d)

        __eq : function(any , any):(any)

    end
    
    
    record LuaRot2

        userdata
    
    --

        cos : number

        sin : number

        cos : number

        sin : number

        clone : function(self:LuaRot2):(LuaRot2)

        as_radians : function(self:LuaRot2):(number)

        as_degrees : function(self:LuaRot2):(number)

        sin_cos : function(self:LuaRot2):(number , number)

        length : function(self:LuaRot2):(number)

        length_squared : function(self:LuaRot2):(number)

        length_recip : function(self:LuaRot2):(number)

        normalize : function(self:LuaRot2):(LuaRot2)

        is_finite : function(self:LuaRot2):(boolean)

        is_nan : function(self:LuaRot2):(boolean)

        is_normalized : function(self:LuaRot2):(boolean)

        is_near_identity : function(self:LuaRot2):(boolean)

        angle_between : function(self:LuaRot2 , LuaRot2):(number)

        inverse : function(self:LuaRot2):(LuaRot2)

        nlerp : function(self:LuaRot2 , LuaRot2 , number):(LuaRot2)

        slerp : function(self:LuaRot2 , LuaRot2 , number):(LuaRot2)

        radians : function(number):(LuaRot2)

        degrees : function(number):(LuaRot2)

        from_sin_cos : function(number , number):(LuaRot2)

        __tostring : function(self:LuaRot2):(string)

        __eq : function(any , any):(any)

        __mul : function(any , any):(any)

    end
    
    
    record ClassLuaRot2

        userdata
    
    --Collection of static methods for [``].

        radians : function(number):(LuaRot2)

        degrees : function(number):(LuaRot2)

        from_sin_cos : function(number , number):(LuaRot2)

        __eq : function(any , any):(any)

        __mul : function(any , any):(any)

    end
    
    
    record LuaDir2

        userdata
    
    --

        as_vec2 : function(self:LuaDir2):(LuaVec2)

        slerp : function(self:LuaDir2 , LuaDir2 , number):(LuaDir2)

        rotation_to : function(self:LuaDir2 , LuaDir2):(LuaRot2)

        rotation_from : function(self:LuaDir2 , LuaDir2):(LuaRot2)

        rotation_from_x : function(self:LuaDir2):(LuaRot2)

        rotation_to_x : function(self:LuaDir2):(LuaRot2)

        rotation_from_y : function(self:LuaDir2):(LuaRot2)

        rotation_to_y : function(self:LuaDir2):(LuaRot2)

        clone : function(self:LuaDir2):(LuaDir2)

        new_unchecked : function(LuaVec2):(LuaDir2)

        __tostring : function(self:LuaDir2):(string)

        __unm : function(any):(any)

        __eq : function(any , any):(any)

        __mul : function(any , any):(any)

    end
    
    
    record ClassLuaDir2

        userdata
    
    --Collection of static methods for [``].

        new_unchecked : function(LuaVec2):(LuaDir2)

        __unm : function(any):(any)

        __eq : function(any , any):(any)

        __mul : function(any , any):(any)

    end
    
    
    record LuaDir3

        userdata
    
    --

        as_vec3 : function(self:LuaDir3):(LuaVec3)

        slerp : function(self:LuaDir3 , LuaDir3 , number):(LuaDir3)

        clone : function(self:LuaDir3):(LuaDir3)

        new_unchecked : function(LuaVec3):(LuaDir3)

        __tostring : function(self:LuaDir3):(string)

        __mul : function(any , any):(any)

        __unm : function(any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaDir3

        userdata
    
    --Collection of static methods for [``].

        new_unchecked : function(LuaVec3):(LuaDir3)

        __mul : function(any , any):(any)

        __unm : function(any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record LuaDir3A

        userdata
    
    --

        clone : function(self:LuaDir3A):(LuaDir3A)

        as_vec3a : function(self:LuaDir3A):(LuaVec3A)

        slerp : function(self:LuaDir3A , LuaDir3A , number):(LuaDir3A)

        new_unchecked : function(LuaVec3A):(LuaDir3A)

        __tostring : function(self:LuaDir3A):(string)

        __mul : function(any , any):(any)

        __eq : function(any , any):(any)

        __unm : function(any):(any)

    end
    
    
    record ClassLuaDir3A

        userdata
    
    --Collection of static methods for [``].

        new_unchecked : function(LuaVec3A):(LuaDir3A)

        __mul : function(any , any):(any)

        __eq : function(any , any):(any)

        __unm : function(any):(any)

    end
    
    
    record LuaIRect

        userdata
    
    --

        min : LuaIVec2

        max : LuaIVec2

        min : LuaIVec2

        max : LuaIVec2

        is_empty : function(self:LuaIRect):(boolean)

        width : function(self:LuaIRect):(integer)

        height : function(self:LuaIRect):(integer)

        size : function(self:LuaIRect):(LuaIVec2)

        half_size : function(self:LuaIRect):(LuaIVec2)

        center : function(self:LuaIRect):(LuaIVec2)

        contains : function(self:LuaIRect , LuaIVec2):(boolean)

        union : function(self:LuaIRect , LuaIRect):(LuaIRect)

        union_point : function(self:LuaIRect , LuaIVec2):(LuaIRect)

        intersect : function(self:LuaIRect , LuaIRect):(LuaIRect)

        inflate : function(self:LuaIRect , integer):(LuaIRect)

        as_rect : function(self:LuaIRect):(LuaRect)

        as_urect : function(self:LuaIRect):(LuaURect)

        assert_receiver_is_total_eq : function(self:LuaIRect)

        clone : function(self:LuaIRect):(LuaIRect)

        new : function(integer , integer , integer , integer):(LuaIRect)

        from_corners : function(LuaIVec2 , LuaIVec2):(LuaIRect)

        from_center_size : function(LuaIVec2 , LuaIVec2):(LuaIRect)

        from_center_half_size : function(LuaIVec2 , LuaIVec2):(LuaIRect)

        __tostring : function(self:LuaIRect):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaIRect

        userdata
    
    --Collection of static methods for [``].

        new : function(integer , integer , integer , integer):(LuaIRect)

        from_corners : function(LuaIVec2 , LuaIVec2):(LuaIRect)

        from_center_size : function(LuaIVec2 , LuaIVec2):(LuaIRect)

        from_center_half_size : function(LuaIVec2 , LuaIVec2):(LuaIRect)

        __eq : function(any , any):(any)

    end
    
    
    record LuaRect

        userdata
    
    --

        min : LuaVec2

        max : LuaVec2

        min : LuaVec2

        max : LuaVec2

        is_empty : function(self:LuaRect):(boolean)

        width : function(self:LuaRect):(number)

        height : function(self:LuaRect):(number)

        size : function(self:LuaRect):(LuaVec2)

        half_size : function(self:LuaRect):(LuaVec2)

        center : function(self:LuaRect):(LuaVec2)

        contains : function(self:LuaRect , LuaVec2):(boolean)

        union : function(self:LuaRect , LuaRect):(LuaRect)

        union_point : function(self:LuaRect , LuaVec2):(LuaRect)

        intersect : function(self:LuaRect , LuaRect):(LuaRect)

        inflate : function(self:LuaRect , number):(LuaRect)

        normalize : function(self:LuaRect , LuaRect):(LuaRect)

        as_irect : function(self:LuaRect):(LuaIRect)

        as_urect : function(self:LuaRect):(LuaURect)

        clone : function(self:LuaRect):(LuaRect)

        new : function(number , number , number , number):(LuaRect)

        from_corners : function(LuaVec2 , LuaVec2):(LuaRect)

        from_center_size : function(LuaVec2 , LuaVec2):(LuaRect)

        from_center_half_size : function(LuaVec2 , LuaVec2):(LuaRect)

        __tostring : function(self:LuaRect):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaRect

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number , number , number):(LuaRect)

        from_corners : function(LuaVec2 , LuaVec2):(LuaRect)

        from_center_size : function(LuaVec2 , LuaVec2):(LuaRect)

        from_center_half_size : function(LuaVec2 , LuaVec2):(LuaRect)

        __eq : function(any , any):(any)

    end
    
    
    record LuaURect

        userdata
    
    --

        min : LuaUVec2

        max : LuaUVec2

        min : LuaUVec2

        max : LuaUVec2

        is_empty : function(self:LuaURect):(boolean)

        width : function(self:LuaURect):(integer)

        height : function(self:LuaURect):(integer)

        size : function(self:LuaURect):(LuaUVec2)

        half_size : function(self:LuaURect):(LuaUVec2)

        center : function(self:LuaURect):(LuaUVec2)

        contains : function(self:LuaURect , LuaUVec2):(boolean)

        union : function(self:LuaURect , LuaURect):(LuaURect)

        union_point : function(self:LuaURect , LuaUVec2):(LuaURect)

        intersect : function(self:LuaURect , LuaURect):(LuaURect)

        inflate : function(self:LuaURect , integer):(LuaURect)

        as_rect : function(self:LuaURect):(LuaRect)

        as_irect : function(self:LuaURect):(LuaIRect)

        clone : function(self:LuaURect):(LuaURect)

        assert_receiver_is_total_eq : function(self:LuaURect)

        new : function(integer , integer , integer , integer):(LuaURect)

        from_corners : function(LuaUVec2 , LuaUVec2):(LuaURect)

        from_center_size : function(LuaUVec2 , LuaUVec2):(LuaURect)

        from_center_half_size : function(LuaUVec2 , LuaUVec2):(LuaURect)

        __tostring : function(self:LuaURect):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaURect

        userdata
    
    --Collection of static methods for [``].

        new : function(integer , integer , integer , integer):(LuaURect)

        from_corners : function(LuaUVec2 , LuaUVec2):(LuaURect)

        from_center_size : function(LuaUVec2 , LuaUVec2):(LuaURect)

        from_center_half_size : function(LuaUVec2 , LuaUVec2):(LuaURect)

        __eq : function(any , any):(any)

    end
    
    
    record LuaAffine3

        userdata
    
    --

        matrix3 : LuaMat3

        translation : LuaVec3

        matrix3 : LuaMat3

        translation : LuaVec3

    end
    
    
    record LuaAabb2d

        userdata
    
    --

        min : LuaVec2

        max : LuaVec2

        min : LuaVec2

        max : LuaVec2

        bounding_circle : function(self:LuaAabb2d):(LuaBoundingCircle)

        closest_point : function(self:LuaAabb2d , LuaVec2):(LuaVec2)

        clone : function(self:LuaAabb2d):(LuaAabb2d)

        new : function(LuaVec2 , LuaVec2):(LuaAabb2d)

        __tostring : function(self:LuaAabb2d):(string)

    end
    
    
    record ClassLuaAabb2d

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaVec2 , LuaVec2):(LuaAabb2d)

    end
    
    
    record LuaBoundingCircle

        userdata
    
    --

        center : LuaVec2

        circle : LuaCircle

        center : LuaVec2

        circle : LuaCircle

        clone : function(self:LuaBoundingCircle):(LuaBoundingCircle)

        radius : function(self:LuaBoundingCircle):(number)

        aabb_2d : function(self:LuaBoundingCircle):(LuaAabb2d)

        closest_point : function(self:LuaBoundingCircle , LuaVec2):(LuaVec2)

        new : function(LuaVec2 , number):(LuaBoundingCircle)

        __tostring : function(self:LuaBoundingCircle):(string)

    end
    
    
    record ClassLuaBoundingCircle

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaVec2 , number):(LuaBoundingCircle)

    end
    
    
    record LuaCircle

        userdata
    
    --

        radius : number

        clone : function(self:LuaCircle):(LuaCircle)

        diameter : function(self:LuaCircle):(number)

        closest_point : function(self:LuaCircle , LuaVec2):(LuaVec2)

        new : function(number):(LuaCircle)

        __tostring : function(self:LuaCircle):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaCircle

        userdata
    
    --Collection of static methods for [``].

        new : function(number):(LuaCircle)

        __eq : function(any , any):(any)

    end
    
    
    record LuaArc2d

        userdata
    
    --

        radius : number

        half_angle : number

        radius : number

        half_angle : number

        clone : function(self:LuaArc2d):(LuaArc2d)

        angle : function(self:LuaArc2d):(number)

        length : function(self:LuaArc2d):(number)

        right_endpoint : function(self:LuaArc2d):(LuaVec2)

        left_endpoint : function(self:LuaArc2d):(LuaVec2)

        midpoint : function(self:LuaArc2d):(LuaVec2)

        half_chord_length : function(self:LuaArc2d):(number)

        chord_length : function(self:LuaArc2d):(number)

        chord_midpoint : function(self:LuaArc2d):(LuaVec2)

        apothem : function(self:LuaArc2d):(number)

        sagitta : function(self:LuaArc2d):(number)

        is_minor : function(self:LuaArc2d):(boolean)

        is_major : function(self:LuaArc2d):(boolean)

        new : function(number , number):(LuaArc2d)

        from_radians : function(number , number):(LuaArc2d)

        from_degrees : function(number , number):(LuaArc2d)

        from_turns : function(number , number):(LuaArc2d)

        __tostring : function(self:LuaArc2d):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaArc2d

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number):(LuaArc2d)

        from_radians : function(number , number):(LuaArc2d)

        from_degrees : function(number , number):(LuaArc2d)

        from_turns : function(number , number):(LuaArc2d)

        __eq : function(any , any):(any)

    end
    
    
    record LuaCapsule2d

        userdata
    
    --

        radius : number

        half_length : number

        radius : number

        half_length : number

        clone : function(self:LuaCapsule2d):(LuaCapsule2d)

        new : function(number , number):(LuaCapsule2d)

        __tostring : function(self:LuaCapsule2d):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaCapsule2d

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number):(LuaCapsule2d)

        __eq : function(any , any):(any)

    end
    
    
    record LuaCircularSector

        userdata
    
    --

        arc : LuaArc2d

        clone : function(self:LuaCircularSector):(LuaCircularSector)

        half_angle : function(self:LuaCircularSector):(number)

        angle : function(self:LuaCircularSector):(number)

        radius : function(self:LuaCircularSector):(number)

        arc_length : function(self:LuaCircularSector):(number)

        half_chord_length : function(self:LuaCircularSector):(number)

        chord_length : function(self:LuaCircularSector):(number)

        chord_midpoint : function(self:LuaCircularSector):(LuaVec2)

        apothem : function(self:LuaCircularSector):(number)

        sagitta : function(self:LuaCircularSector):(number)

        area : function(self:LuaCircularSector):(number)

        new : function(number , number):(LuaCircularSector)

        from_radians : function(number , number):(LuaCircularSector)

        from_degrees : function(number , number):(LuaCircularSector)

        from_turns : function(number , number):(LuaCircularSector)

        __tostring : function(self:LuaCircularSector):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaCircularSector

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number):(LuaCircularSector)

        from_radians : function(number , number):(LuaCircularSector)

        from_degrees : function(number , number):(LuaCircularSector)

        from_turns : function(number , number):(LuaCircularSector)

        __eq : function(any , any):(any)

    end
    
    
    record LuaCircularSegment

        userdata
    
    --

        arc : LuaArc2d

        clone : function(self:LuaCircularSegment):(LuaCircularSegment)

        half_angle : function(self:LuaCircularSegment):(number)

        angle : function(self:LuaCircularSegment):(number)

        radius : function(self:LuaCircularSegment):(number)

        arc_length : function(self:LuaCircularSegment):(number)

        half_chord_length : function(self:LuaCircularSegment):(number)

        chord_length : function(self:LuaCircularSegment):(number)

        chord_midpoint : function(self:LuaCircularSegment):(LuaVec2)

        apothem : function(self:LuaCircularSegment):(number)

        sagitta : function(self:LuaCircularSegment):(number)

        area : function(self:LuaCircularSegment):(number)

        new : function(number , number):(LuaCircularSegment)

        from_radians : function(number , number):(LuaCircularSegment)

        from_degrees : function(number , number):(LuaCircularSegment)

        from_turns : function(number , number):(LuaCircularSegment)

        __tostring : function(self:LuaCircularSegment):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaCircularSegment

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number):(LuaCircularSegment)

        from_radians : function(number , number):(LuaCircularSegment)

        from_degrees : function(number , number):(LuaCircularSegment)

        from_turns : function(number , number):(LuaCircularSegment)

        __eq : function(any , any):(any)

    end
    
    
    record LuaEllipse

        userdata
    
    --

        half_size : LuaVec2

        eccentricity : function(self:LuaEllipse):(number)

        focal_length : function(self:LuaEllipse):(number)

        semi_major : function(self:LuaEllipse):(number)

        semi_minor : function(self:LuaEllipse):(number)

        clone : function(self:LuaEllipse):(LuaEllipse)

        new : function(number , number):(LuaEllipse)

        from_size : function(LuaVec2):(LuaEllipse)

        __tostring : function(self:LuaEllipse):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaEllipse

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number):(LuaEllipse)

        from_size : function(LuaVec2):(LuaEllipse)

        __eq : function(any , any):(any)

    end
    
    
    record LuaLine2d

        userdata
    
    --

        direction : LuaDir2

        clone : function(self:LuaLine2d):(LuaLine2d)

        __tostring : function(self:LuaLine2d):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaPlane2d

        userdata
    
    --

        normal : LuaDir2

        clone : function(self:LuaPlane2d):(LuaPlane2d)

        new : function(LuaVec2):(LuaPlane2d)

        __tostring : function(self:LuaPlane2d):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaPlane2d

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaVec2):(LuaPlane2d)

        __eq : function(any , any):(any)

    end
    
    
    record LuaRectangle

        userdata
    
    --

        half_size : LuaVec2

        size : function(self:LuaRectangle):(LuaVec2)

        closest_point : function(self:LuaRectangle , LuaVec2):(LuaVec2)

        clone : function(self:LuaRectangle):(LuaRectangle)

        new : function(number , number):(LuaRectangle)

        from_size : function(LuaVec2):(LuaRectangle)

        from_corners : function(LuaVec2 , LuaVec2):(LuaRectangle)

        from_length : function(number):(LuaRectangle)

        __tostring : function(self:LuaRectangle):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaRectangle

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number):(LuaRectangle)

        from_size : function(LuaVec2):(LuaRectangle)

        from_corners : function(LuaVec2 , LuaVec2):(LuaRectangle)

        from_length : function(number):(LuaRectangle)

        __eq : function(any , any):(any)

    end
    
    
    record LuaRegularPolygon

        userdata
    
    --

        circumcircle : LuaCircle

        sides : integer

        circumcircle : LuaCircle

        sides : integer

        clone : function(self:LuaRegularPolygon):(LuaRegularPolygon)

        circumradius : function(self:LuaRegularPolygon):(number)

        inradius : function(self:LuaRegularPolygon):(number)

        side_length : function(self:LuaRegularPolygon):(number)

        internal_angle_degrees : function(self:LuaRegularPolygon):(number)

        internal_angle_radians : function(self:LuaRegularPolygon):(number)

        external_angle_degrees : function(self:LuaRegularPolygon):(number)

        external_angle_radians : function(self:LuaRegularPolygon):(number)

        new : function(number , integer):(LuaRegularPolygon)

        __tostring : function(self:LuaRegularPolygon):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaRegularPolygon

        userdata
    
    --Collection of static methods for [``].

        new : function(number , integer):(LuaRegularPolygon)

        __eq : function(any , any):(any)

    end
    
    
    record LuaRhombus

        userdata
    
    --

        half_diagonals : LuaVec2

        clone : function(self:LuaRhombus):(LuaRhombus)

        side : function(self:LuaRhombus):(number)

        circumradius : function(self:LuaRhombus):(number)

        inradius : function(self:LuaRhombus):(number)

        closest_point : function(self:LuaRhombus , LuaVec2):(LuaVec2)

        new : function(number , number):(LuaRhombus)

        from_side : function(number):(LuaRhombus)

        from_inradius : function(number):(LuaRhombus)

        __tostring : function(self:LuaRhombus):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaRhombus

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number):(LuaRhombus)

        from_side : function(number):(LuaRhombus)

        from_inradius : function(number):(LuaRhombus)

        __eq : function(any , any):(any)

    end
    
    
    record LuaSegment2d

        userdata
    
    --

        direction : LuaDir2

        half_length : number

        direction : LuaDir2

        half_length : number

        point1 : function(self:LuaSegment2d):(LuaVec2)

        point2 : function(self:LuaSegment2d):(LuaVec2)

        clone : function(self:LuaSegment2d):(LuaSegment2d)

        new : function(LuaDir2 , number):(LuaSegment2d)

        __tostring : function(self:LuaSegment2d):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaSegment2d

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaDir2 , number):(LuaSegment2d)

        __eq : function(any , any):(any)

    end
    
    
    record LuaTriangle2d

        userdata
    
    --

        vertices : ReflectedValue

        clone : function(self:LuaTriangle2d):(LuaTriangle2d)

        is_degenerate : function(self:LuaTriangle2d):(boolean)

        is_acute : function(self:LuaTriangle2d):(boolean)

        is_obtuse : function(self:LuaTriangle2d):(boolean)

        reversed : function(self:LuaTriangle2d):(LuaTriangle2d)

        reverse : function(self:LuaTriangle2d)

        new : function(LuaVec2 , LuaVec2 , LuaVec2):(LuaTriangle2d)

        __tostring : function(self:LuaTriangle2d):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaTriangle2d

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaVec2 , LuaVec2 , LuaVec2):(LuaTriangle2d)

        __eq : function(any , any):(any)

    end
    
    
    record LuaAabb3d

        userdata
    
    --

        min : LuaVec3A

        max : LuaVec3A

        min : LuaVec3A

        max : LuaVec3A

        bounding_sphere : function(self:LuaAabb3d):(LuaBoundingSphere)

        clone : function(self:LuaAabb3d):(LuaAabb3d)

        __tostring : function(self:LuaAabb3d):(string)

    end
    
    
    record LuaBoundingSphere

        userdata
    
    --

        center : LuaVec3A

        sphere : LuaSphere

        center : LuaVec3A

        sphere : LuaSphere

        radius : function(self:LuaBoundingSphere):(number)

        aabb_3d : function(self:LuaBoundingSphere):(LuaAabb3d)

        clone : function(self:LuaBoundingSphere):(LuaBoundingSphere)

        __tostring : function(self:LuaBoundingSphere):(string)

    end
    
    
    record LuaSphere

        userdata
    
    --

        radius : number

        diameter : function(self:LuaSphere):(number)

        closest_point : function(self:LuaSphere , LuaVec3):(LuaVec3)

        clone : function(self:LuaSphere):(LuaSphere)

        new : function(number):(LuaSphere)

        __tostring : function(self:LuaSphere):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaSphere

        userdata
    
    --Collection of static methods for [``].

        new : function(number):(LuaSphere)

        __eq : function(any , any):(any)

    end
    
    
    record LuaCuboid

        userdata
    
    --

        half_size : LuaVec3

        size : function(self:LuaCuboid):(LuaVec3)

        closest_point : function(self:LuaCuboid , LuaVec3):(LuaVec3)

        clone : function(self:LuaCuboid):(LuaCuboid)

        new : function(number , number , number):(LuaCuboid)

        from_size : function(LuaVec3):(LuaCuboid)

        from_corners : function(LuaVec3 , LuaVec3):(LuaCuboid)

        from_length : function(number):(LuaCuboid)

        __tostring : function(self:LuaCuboid):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaCuboid

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number , number):(LuaCuboid)

        from_size : function(LuaVec3):(LuaCuboid)

        from_corners : function(LuaVec3 , LuaVec3):(LuaCuboid)

        from_length : function(number):(LuaCuboid)

        __eq : function(any , any):(any)

    end
    
    
    record LuaCylinder

        userdata
    
    --

        radius : number

        half_height : number

        radius : number

        half_height : number

        clone : function(self:LuaCylinder):(LuaCylinder)

        base : function(self:LuaCylinder):(LuaCircle)

        lateral_area : function(self:LuaCylinder):(number)

        base_area : function(self:LuaCylinder):(number)

        new : function(number , number):(LuaCylinder)

        __tostring : function(self:LuaCylinder):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaCylinder

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number):(LuaCylinder)

        __eq : function(any , any):(any)

    end
    
    
    record LuaCapsule3d

        userdata
    
    --

        radius : number

        half_length : number

        radius : number

        half_length : number

        to_cylinder : function(self:LuaCapsule3d):(LuaCylinder)

        clone : function(self:LuaCapsule3d):(LuaCapsule3d)

        new : function(number , number):(LuaCapsule3d)

        __tostring : function(self:LuaCapsule3d):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaCapsule3d

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number):(LuaCapsule3d)

        __eq : function(any , any):(any)

    end
    
    
    record LuaCone

        userdata
    
    --

        radius : number

        height : number

        radius : number

        height : number

        clone : function(self:LuaCone):(LuaCone)

        base : function(self:LuaCone):(LuaCircle)

        slant_height : function(self:LuaCone):(number)

        lateral_area : function(self:LuaCone):(number)

        base_area : function(self:LuaCone):(number)

        __tostring : function(self:LuaCone):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaConicalFrustum

        userdata
    
    --

        radius_top : number

        radius_bottom : number

        height : number

        radius_top : number

        radius_bottom : number

        height : number

        clone : function(self:LuaConicalFrustum):(LuaConicalFrustum)

        __tostring : function(self:LuaConicalFrustum):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaInfinitePlane3d

        userdata
    
    --

        normal : LuaDir3

        clone : function(self:LuaInfinitePlane3d):(LuaInfinitePlane3d)

        __tostring : function(self:LuaInfinitePlane3d):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaLine3d

        userdata
    
    --

        direction : LuaDir3

        clone : function(self:LuaLine3d):(LuaLine3d)

        __tostring : function(self:LuaLine3d):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaSegment3d

        userdata
    
    --

        direction : LuaDir3

        half_length : number

        direction : LuaDir3

        half_length : number

        point1 : function(self:LuaSegment3d):(LuaVec3)

        point2 : function(self:LuaSegment3d):(LuaVec3)

        clone : function(self:LuaSegment3d):(LuaSegment3d)

        new : function(LuaDir3 , number):(LuaSegment3d)

        __tostring : function(self:LuaSegment3d):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaSegment3d

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaDir3 , number):(LuaSegment3d)

        __eq : function(any , any):(any)

    end
    
    
    record LuaTorus

        userdata
    
    --

        minor_radius : number

        major_radius : number

        minor_radius : number

        major_radius : number

        inner_radius : function(self:LuaTorus):(number)

        outer_radius : function(self:LuaTorus):(number)

        clone : function(self:LuaTorus):(LuaTorus)

        new : function(number , number):(LuaTorus)

        __tostring : function(self:LuaTorus):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaTorus

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number):(LuaTorus)

        __eq : function(any , any):(any)

    end
    
    
    record LuaTriangle3d

        userdata
    
    --

        vertices : ReflectedValue

        clone : function(self:LuaTriangle3d):(LuaTriangle3d)

        is_degenerate : function(self:LuaTriangle3d):(boolean)

        is_acute : function(self:LuaTriangle3d):(boolean)

        is_obtuse : function(self:LuaTriangle3d):(boolean)

        reversed : function(self:LuaTriangle3d):(LuaTriangle3d)

        centroid : function(self:LuaTriangle3d):(LuaVec3)

        circumcenter : function(self:LuaTriangle3d):(LuaVec3)

        reverse : function(self:LuaTriangle3d)

        new : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaTriangle3d)

        __tostring : function(self:LuaTriangle3d):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaTriangle3d

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaTriangle3d)

        __eq : function(any , any):(any)

    end
    
    
    record LuaRayCast2d

        userdata
    
    --

        ray : LuaRay2d

        max : number

        ray : LuaRay2d

        max : number

        clone : function(self:LuaRayCast2d):(LuaRayCast2d)

        direction_recip : function(self:LuaRayCast2d):(LuaVec2)

        aabb_intersection_at : function(self:LuaRayCast2d , LuaAabb2d):(number)

        circle_intersection_at : function(self:LuaRayCast2d , LuaBoundingCircle):(number)

        new : function(LuaVec2 , LuaDir2 , number):(LuaRayCast2d)

        from_ray : function(LuaRay2d , number):(LuaRayCast2d)

        __tostring : function(self:LuaRayCast2d):(string)

    end
    
    
    record ClassLuaRayCast2d

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaVec2 , LuaDir2 , number):(LuaRayCast2d)

        from_ray : function(LuaRay2d , number):(LuaRayCast2d)

    end
    
    
    record LuaAabbCast2d

        userdata
    
    --

        ray : LuaRayCast2d

        aabb : LuaAabb2d

        ray : LuaRayCast2d

        aabb : LuaAabb2d

        clone : function(self:LuaAabbCast2d):(LuaAabbCast2d)

        aabb_collision_at : function(self:LuaAabbCast2d , LuaAabb2d):(number)

        new : function(LuaAabb2d , LuaVec2 , LuaDir2 , number):(LuaAabbCast2d)

        from_ray : function(LuaAabb2d , LuaRay2d , number):(LuaAabbCast2d)

        __tostring : function(self:LuaAabbCast2d):(string)

    end
    
    
    record ClassLuaAabbCast2d

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaAabb2d , LuaVec2 , LuaDir2 , number):(LuaAabbCast2d)

        from_ray : function(LuaAabb2d , LuaRay2d , number):(LuaAabbCast2d)

    end
    
    
    record LuaBoundingCircleCast

        userdata
    
    --

        ray : LuaRayCast2d

        circle : LuaBoundingCircle

        ray : LuaRayCast2d

        circle : LuaBoundingCircle

        circle_collision_at : function(self:LuaBoundingCircleCast , LuaBoundingCircle):(number)

        clone : function(self:LuaBoundingCircleCast):(LuaBoundingCircleCast)

        new : function(LuaBoundingCircle , LuaVec2 , LuaDir2 , number):(LuaBoundingCircleCast)

        from_ray : function(LuaBoundingCircle , LuaRay2d , number):(LuaBoundingCircleCast)

        __tostring : function(self:LuaBoundingCircleCast):(string)

    end
    
    
    record ClassLuaBoundingCircleCast

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaBoundingCircle , LuaVec2 , LuaDir2 , number):(LuaBoundingCircleCast)

        from_ray : function(LuaBoundingCircle , LuaRay2d , number):(LuaBoundingCircleCast)

    end
    
    
    record LuaRayCast3d

        userdata
    
    --

        origin : LuaVec3A

        direction : LuaDir3A

        max : number

        origin : LuaVec3A

        direction : LuaDir3A

        max : number

        direction_recip : function(self:LuaRayCast3d):(LuaVec3A)

        aabb_intersection_at : function(self:LuaRayCast3d , LuaAabb3d):(number)

        sphere_intersection_at : function(self:LuaRayCast3d , LuaBoundingSphere):(number)

        clone : function(self:LuaRayCast3d):(LuaRayCast3d)

        from_ray : function(LuaRay3d , number):(LuaRayCast3d)

        __tostring : function(self:LuaRayCast3d):(string)

    end
    
    
    record ClassLuaRayCast3d

        userdata
    
    --Collection of static methods for [``].

        from_ray : function(LuaRay3d , number):(LuaRayCast3d)

    end
    
    
    record LuaAabbCast3d

        userdata
    
    --

        ray : LuaRayCast3d

        aabb : LuaAabb3d

        ray : LuaRayCast3d

        aabb : LuaAabb3d

        aabb_collision_at : function(self:LuaAabbCast3d , LuaAabb3d):(number)

        clone : function(self:LuaAabbCast3d):(LuaAabbCast3d)

        from_ray : function(LuaAabb3d , LuaRay3d , number):(LuaAabbCast3d)

        __tostring : function(self:LuaAabbCast3d):(string)

    end
    
    
    record ClassLuaAabbCast3d

        userdata
    
    --Collection of static methods for [``].

        from_ray : function(LuaAabb3d , LuaRay3d , number):(LuaAabbCast3d)

    end
    
    
    record LuaBoundingSphereCast

        userdata
    
    --

        ray : LuaRayCast3d

        sphere : LuaBoundingSphere

        ray : LuaRayCast3d

        sphere : LuaBoundingSphere

        clone : function(self:LuaBoundingSphereCast):(LuaBoundingSphereCast)

        sphere_collision_at : function(self:LuaBoundingSphereCast , LuaBoundingSphere):(number)

        from_ray : function(LuaBoundingSphere , LuaRay3d , number):(LuaBoundingSphereCast)

        __tostring : function(self:LuaBoundingSphereCast):(string)

    end
    
    
    record ClassLuaBoundingSphereCast

        userdata
    
    --Collection of static methods for [``].

        from_ray : function(LuaBoundingSphere , LuaRay3d , number):(LuaBoundingSphereCast)

    end
    
    
    record LuaFloatOrd

        userdata
    
    --

        _0 : number

        lt : function(self:LuaFloatOrd , LuaFloatOrd):(boolean)

        le : function(self:LuaFloatOrd , LuaFloatOrd):(boolean)

        gt : function(self:LuaFloatOrd , LuaFloatOrd):(boolean)

        ge : function(self:LuaFloatOrd , LuaFloatOrd):(boolean)

        clone : function(self:LuaFloatOrd):(LuaFloatOrd)

        __tostring : function(self:LuaFloatOrd):(string)

        __eq : function(any , any):(any)

        __unm : function(any):(any)

    end
    
    
    record LuaAnnulus

        userdata
    
    --

        inner_circle : LuaCircle

        outer_circle : LuaCircle

        inner_circle : LuaCircle

        outer_circle : LuaCircle

        diameter : function(self:LuaAnnulus):(number)

        thickness : function(self:LuaAnnulus):(number)

        closest_point : function(self:LuaAnnulus , LuaVec2):(LuaVec2)

        clone : function(self:LuaAnnulus):(LuaAnnulus)

        new : function(number , number):(LuaAnnulus)

        __tostring : function(self:LuaAnnulus):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaAnnulus

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number):(LuaAnnulus)

        __eq : function(any , any):(any)

    end
    
    
    record LuaPlane3d

        userdata
    
    --

        normal : LuaDir3

        half_size : LuaVec2

        normal : LuaDir3

        half_size : LuaVec2

        clone : function(self:LuaPlane3d):(LuaPlane3d)

        new : function(LuaVec3 , LuaVec2):(LuaPlane3d)

        __tostring : function(self:LuaPlane3d):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaPlane3d

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaVec3 , LuaVec2):(LuaPlane3d)

        __eq : function(any , any):(any)

    end
    
    
    record LuaTetrahedron

        userdata
    
    --

        vertices : ReflectedValue

        clone : function(self:LuaTetrahedron):(LuaTetrahedron)

        signed_volume : function(self:LuaTetrahedron):(number)

        centroid : function(self:LuaTetrahedron):(LuaVec3)

        new : function(LuaVec3 , LuaVec3 , LuaVec3 , LuaVec3):(LuaTetrahedron)

        __tostring : function(self:LuaTetrahedron):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaTetrahedron

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaVec3 , LuaVec3 , LuaVec3 , LuaVec3):(LuaTetrahedron)

        __eq : function(any , any):(any)

    end
    
    
    record LuaGamepad

        userdata
    
    --

        id : integer

        assert_receiver_is_total_eq : function(self:LuaGamepad)

        clone : function(self:LuaGamepad):(LuaGamepad)

        new : function(integer):(LuaGamepad)

        __tostring : function(self:LuaGamepad):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaGamepad

        userdata
    
    --Collection of static methods for [``].

        new : function(integer):(LuaGamepad)

        __eq : function(any , any):(any)

    end
    
    
    record LuaGamepadAxis

        userdata
    
    --

        gamepad : LuaGamepad

        axis_type : LuaGamepadAxisType

        gamepad : LuaGamepad

        axis_type : LuaGamepadAxisType

        clone : function(self:LuaGamepadAxis):(LuaGamepadAxis)

        assert_receiver_is_total_eq : function(self:LuaGamepadAxis)

        new : function(LuaGamepad , LuaGamepadAxisType):(LuaGamepadAxis)

        __tostring : function(self:LuaGamepadAxis):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaGamepadAxis

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaGamepad , LuaGamepadAxisType):(LuaGamepadAxis)

        __eq : function(any , any):(any)

    end
    
    
    record LuaGamepadAxisType

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaGamepadAxisType)

        clone : function(self:LuaGamepadAxisType):(LuaGamepadAxisType)

        __tostring : function(self:LuaGamepadAxisType):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaGamepadButton

        userdata
    
    --

        gamepad : LuaGamepad

        button_type : LuaGamepadButtonType

        gamepad : LuaGamepad

        button_type : LuaGamepadButtonType

        assert_receiver_is_total_eq : function(self:LuaGamepadButton)

        clone : function(self:LuaGamepadButton):(LuaGamepadButton)

        new : function(LuaGamepad , LuaGamepadButtonType):(LuaGamepadButton)

        __tostring : function(self:LuaGamepadButton):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaGamepadButton

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaGamepad , LuaGamepadButtonType):(LuaGamepadButton)

        __eq : function(any , any):(any)

    end
    
    
    record LuaGamepadButtonType

        userdata
    
    --

        clone : function(self:LuaGamepadButtonType):(LuaGamepadButtonType)

        assert_receiver_is_total_eq : function(self:LuaGamepadButtonType)

        __tostring : function(self:LuaGamepadButtonType):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaKeyCode

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaKeyCode)

        clone : function(self:LuaKeyCode):(LuaKeyCode)

        __tostring : function(self:LuaKeyCode):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaMouseButton

        userdata
    
    --

        clone : function(self:LuaMouseButton):(LuaMouseButton)

        assert_receiver_is_total_eq : function(self:LuaMouseButton)

        __tostring : function(self:LuaMouseButton):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaTouchInput

        userdata
    
    --

        phase : LuaTouchPhase

        position : LuaVec2

        window : LuaEntity

        force : ReflectedValue

        id : integer

        phase : LuaTouchPhase

        position : LuaVec2

        window : LuaEntity

        force : ReflectedValue

        id : integer

        clone : function(self:LuaTouchInput):(LuaTouchInput)

        __tostring : function(self:LuaTouchInput):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaKeyboardFocusLost

        userdata
    
    --

        clone : function(self:LuaKeyboardFocusLost):(LuaKeyboardFocusLost)

        assert_receiver_is_total_eq : function(self:LuaKeyboardFocusLost)

        __tostring : function(self:LuaKeyboardFocusLost):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaKeyboardInput

        userdata
    
    --

        key_code : LuaKeyCode

        logical_key : LuaKey

        state : LuaButtonState

        window : LuaEntity

        key_code : LuaKeyCode

        logical_key : LuaKey

        state : LuaButtonState

        window : LuaEntity

        assert_receiver_is_total_eq : function(self:LuaKeyboardInput)

        clone : function(self:LuaKeyboardInput):(LuaKeyboardInput)

        __tostring : function(self:LuaKeyboardInput):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaMouseButtonInput

        userdata
    
    --

        button : LuaMouseButton

        state : LuaButtonState

        window : LuaEntity

        button : LuaMouseButton

        state : LuaButtonState

        window : LuaEntity

        assert_receiver_is_total_eq : function(self:LuaMouseButtonInput)

        clone : function(self:LuaMouseButtonInput):(LuaMouseButtonInput)

        __tostring : function(self:LuaMouseButtonInput):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaMouseMotion

        userdata
    
    --

        delta : LuaVec2

        clone : function(self:LuaMouseMotion):(LuaMouseMotion)

        __tostring : function(self:LuaMouseMotion):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaMouseWheel

        userdata
    
    --

        unit : LuaMouseScrollUnit

        x : number

        y : number

        window : LuaEntity

        unit : LuaMouseScrollUnit

        x : number

        y : number

        window : LuaEntity

        clone : function(self:LuaMouseWheel):(LuaMouseWheel)

        __tostring : function(self:LuaMouseWheel):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaGamepadAxisChangedEvent

        userdata
    
    --

        gamepad : LuaGamepad

        axis_type : LuaGamepadAxisType

        value : number

        gamepad : LuaGamepad

        axis_type : LuaGamepadAxisType

        value : number

        clone : function(self:LuaGamepadAxisChangedEvent):(LuaGamepadAxisChangedEvent)

        new : function(LuaGamepad , LuaGamepadAxisType , number):(LuaGamepadAxisChangedEvent)

        __tostring : function(self:LuaGamepadAxisChangedEvent):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaGamepadAxisChangedEvent

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaGamepad , LuaGamepadAxisType , number):(LuaGamepadAxisChangedEvent)

        __eq : function(any , any):(any)

    end
    
    
    record LuaGamepadButtonChangedEvent

        userdata
    
    --

        gamepad : LuaGamepad

        button_type : LuaGamepadButtonType

        value : number

        gamepad : LuaGamepad

        button_type : LuaGamepadButtonType

        value : number

        clone : function(self:LuaGamepadButtonChangedEvent):(LuaGamepadButtonChangedEvent)

        new : function(LuaGamepad , LuaGamepadButtonType , number):(LuaGamepadButtonChangedEvent)

        __tostring : function(self:LuaGamepadButtonChangedEvent):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaGamepadButtonChangedEvent

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaGamepad , LuaGamepadButtonType , number):(LuaGamepadButtonChangedEvent)

        __eq : function(any , any):(any)

    end
    
    
    record LuaGamepadButtonInput

        userdata
    
    --

        button : LuaGamepadButton

        state : LuaButtonState

        button : LuaGamepadButton

        state : LuaButtonState

        clone : function(self:LuaGamepadButtonInput):(LuaGamepadButtonInput)

        assert_receiver_is_total_eq : function(self:LuaGamepadButtonInput)

        __tostring : function(self:LuaGamepadButtonInput):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaGamepadConnectionEvent

        userdata
    
    --

        gamepad : LuaGamepad

        connection : LuaGamepadConnection

        gamepad : LuaGamepad

        connection : LuaGamepadConnection

        clone : function(self:LuaGamepadConnectionEvent):(LuaGamepadConnectionEvent)

        connected : function(self:LuaGamepadConnectionEvent):(boolean)

        disconnected : function(self:LuaGamepadConnectionEvent):(boolean)

        new : function(LuaGamepad , LuaGamepadConnection):(LuaGamepadConnectionEvent)

        __tostring : function(self:LuaGamepadConnectionEvent):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaGamepadConnectionEvent

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaGamepad , LuaGamepadConnection):(LuaGamepadConnectionEvent)

        __eq : function(any , any):(any)

    end
    
    
    record LuaGamepadEvent

        userdata
    
    --

        clone : function(self:LuaGamepadEvent):(LuaGamepadEvent)

        __tostring : function(self:LuaGamepadEvent):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaGamepadSettings

        userdata
    
    --

        default_button_settings : LuaButtonSettings

        default_axis_settings : LuaAxisSettings

        default_button_axis_settings : LuaButtonAxisSettings

        button_settings : ReflectedValue

        axis_settings : ReflectedValue

        button_axis_settings : ReflectedValue

        default_button_settings : LuaButtonSettings

        default_axis_settings : LuaAxisSettings

        default_button_axis_settings : LuaButtonAxisSettings

        button_settings : ReflectedValue

        axis_settings : ReflectedValue

        button_axis_settings : ReflectedValue

        __tostring : function(self:LuaGamepadSettings):(string)

    end
    
    
    record LuaPinchGesture

        userdata
    
    --

        _0 : number

        clone : function(self:LuaPinchGesture):(LuaPinchGesture)

        __tostring : function(self:LuaPinchGesture):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaRotationGesture

        userdata
    
    --

        _0 : number

        clone : function(self:LuaRotationGesture):(LuaRotationGesture)

        __tostring : function(self:LuaRotationGesture):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaDoubleTapGesture

        userdata
    
    --

        clone : function(self:LuaDoubleTapGesture):(LuaDoubleTapGesture)

        __tostring : function(self:LuaDoubleTapGesture):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaPanGesture

        userdata
    
    --

        _0 : LuaVec2

        clone : function(self:LuaPanGesture):(LuaPanGesture)

        __tostring : function(self:LuaPanGesture):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaButtonState

        userdata
    
    --

        clone : function(self:LuaButtonState):(LuaButtonState)

        assert_receiver_is_total_eq : function(self:LuaButtonState)

        is_pressed : function(self:LuaButtonState):(boolean)

        __tostring : function(self:LuaButtonState):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaGamepadInfo

        userdata
    
    --

        name : string

        assert_receiver_is_total_eq : function(self:LuaGamepadInfo)

        clone : function(self:LuaGamepadInfo):(LuaGamepadInfo)

        __tostring : function(self:LuaGamepadInfo):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaButtonSettings

        userdata
    
    --

        is_pressed : function(self:LuaButtonSettings , number):(boolean)

        is_released : function(self:LuaButtonSettings , number):(boolean)

        press_threshold : function(self:LuaButtonSettings):(number)

        release_threshold : function(self:LuaButtonSettings):(number)

        clone : function(self:LuaButtonSettings):(LuaButtonSettings)

        set_press_threshold : function(self:LuaButtonSettings , number):(number)

        set_release_threshold : function(self:LuaButtonSettings , number):(number)

        __tostring : function(self:LuaButtonSettings):(string)

    end
    
    
    record LuaAxisSettings

        userdata
    
    --

        clone : function(self:LuaAxisSettings):(LuaAxisSettings)

        livezone_upperbound : function(self:LuaAxisSettings):(number)

        deadzone_upperbound : function(self:LuaAxisSettings):(number)

        livezone_lowerbound : function(self:LuaAxisSettings):(number)

        deadzone_lowerbound : function(self:LuaAxisSettings):(number)

        threshold : function(self:LuaAxisSettings):(number)

        clamp : function(self:LuaAxisSettings , number):(number)

        filter : function(self:LuaAxisSettings , number , number):(number)

        set_livezone_upperbound : function(self:LuaAxisSettings , number):(number)

        set_deadzone_upperbound : function(self:LuaAxisSettings , number):(number)

        set_livezone_lowerbound : function(self:LuaAxisSettings , number):(number)

        set_deadzone_lowerbound : function(self:LuaAxisSettings , number):(number)

        set_threshold : function(self:LuaAxisSettings , number):(number)

        __tostring : function(self:LuaAxisSettings):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaButtonAxisSettings

        userdata
    
    --

        high : number

        low : number

        threshold : number

        high : number

        low : number

        threshold : number

        filter : function(self:LuaButtonAxisSettings , number , number):(number)

        clone : function(self:LuaButtonAxisSettings):(LuaButtonAxisSettings)

        __tostring : function(self:LuaButtonAxisSettings):(string)

    end
    
    
    record LuaGamepadConnection

        userdata
    
    --

        clone : function(self:LuaGamepadConnection):(LuaGamepadConnection)

        __tostring : function(self:LuaGamepadConnection):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaKey

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaKey)

        clone : function(self:LuaKey):(LuaKey)

        __tostring : function(self:LuaKey):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaNativeKeyCode

        userdata
    
    --

        clone : function(self:LuaNativeKeyCode):(LuaNativeKeyCode)

        assert_receiver_is_total_eq : function(self:LuaNativeKeyCode)

        __tostring : function(self:LuaNativeKeyCode):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaNativeKey

        userdata
    
    --

        clone : function(self:LuaNativeKey):(LuaNativeKey)

        assert_receiver_is_total_eq : function(self:LuaNativeKey)

        __tostring : function(self:LuaNativeKey):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaMouseScrollUnit

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaMouseScrollUnit)

        clone : function(self:LuaMouseScrollUnit):(LuaMouseScrollUnit)

        __tostring : function(self:LuaMouseScrollUnit):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaTouchPhase

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaTouchPhase)

        clone : function(self:LuaTouchPhase):(LuaTouchPhase)

        __tostring : function(self:LuaTouchPhase):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaForceTouch

        userdata
    
    --

        clone : function(self:LuaForceTouch):(LuaForceTouch)

        __tostring : function(self:LuaForceTouch):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaName

        userdata
    
    --

        clone : function(self:LuaName):(LuaName)

        __tostring : function(self:LuaName):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaFixed

        userdata
    
    --

        clone : function(self:LuaFixed):(LuaFixed)

        __tostring : function(self:LuaFixed):(string)

    end
    
    
    record LuaReal

        userdata
    
    --

        clone : function(self:LuaReal):(LuaReal)

        __tostring : function(self:LuaReal):(string)

    end
    
    
    record LuaTimer

        userdata
    
    --

        clone : function(self:LuaTimer):(LuaTimer)

        finished : function(self:LuaTimer):(boolean)

        just_finished : function(self:LuaTimer):(boolean)

        elapsed : function(self:LuaTimer):(LuaDuration)

        elapsed_secs : function(self:LuaTimer):(number)

        duration : function(self:LuaTimer):(LuaDuration)

        mode : function(self:LuaTimer):(LuaTimerMode)

        paused : function(self:LuaTimer):(boolean)

        fraction : function(self:LuaTimer):(number)

        fraction_remaining : function(self:LuaTimer):(number)

        remaining_secs : function(self:LuaTimer):(number)

        remaining : function(self:LuaTimer):(LuaDuration)

        times_finished_this_tick : function(self:LuaTimer):(integer)

        assert_receiver_is_total_eq : function(self:LuaTimer)

        set_elapsed : function(self:LuaTimer , LuaDuration)

        set_duration : function(self:LuaTimer , LuaDuration)

        set_mode : function(self:LuaTimer , LuaTimerMode)

        pause : function(self:LuaTimer)

        unpause : function(self:LuaTimer)

        reset : function(self:LuaTimer)

        new : function(LuaDuration , LuaTimerMode):(LuaTimer)

        from_seconds : function(number , LuaTimerMode):(LuaTimer)

        __tostring : function(self:LuaTimer):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaTimer

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaDuration , LuaTimerMode):(LuaTimer)

        from_seconds : function(number , LuaTimerMode):(LuaTimer)

        __eq : function(any , any):(any)

    end
    
    
    record LuaTimerMode

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaTimerMode)

        clone : function(self:LuaTimerMode):(LuaTimerMode)

        __tostring : function(self:LuaTimerMode):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaVirtual

        userdata
    
    --

        clone : function(self:LuaVirtual):(LuaVirtual)

        __tostring : function(self:LuaVirtual):(string)

    end
    
    
    record LuaStopwatch

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaStopwatch)

        elapsed : function(self:LuaStopwatch):(LuaDuration)

        elapsed_secs : function(self:LuaStopwatch):(number)

        elapsed_secs_f64 : function(self:LuaStopwatch):(number)

        paused : function(self:LuaStopwatch):(boolean)

        clone : function(self:LuaStopwatch):(LuaStopwatch)

        set_elapsed : function(self:LuaStopwatch , LuaDuration)

        pause : function(self:LuaStopwatch)

        unpause : function(self:LuaStopwatch)

        reset : function(self:LuaStopwatch)

        new : function():(LuaStopwatch)

        __tostring : function(self:LuaStopwatch):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaStopwatch

        userdata
    
    --Collection of static methods for [``].

        new : function():(LuaStopwatch)

        __eq : function(any , any):(any)

    end
    
    
    record LuaChildren

        userdata
    
    --

        swap : function(self:LuaChildren , integer , integer)

        __tostring : function(self:LuaChildren):(string)

    end
    
    
    record LuaParent

        userdata
    
    --

        get : function(self:LuaParent):(LuaEntity)

        assert_receiver_is_total_eq : function(self:LuaParent)

        __tostring : function(self:LuaParent):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaCursorEntered

        userdata
    
    --

        window : LuaEntity

        clone : function(self:LuaCursorEntered):(LuaCursorEntered)

        assert_receiver_is_total_eq : function(self:LuaCursorEntered)

        __tostring : function(self:LuaCursorEntered):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaCursorIcon

        userdata
    
    --

        clone : function(self:LuaCursorIcon):(LuaCursorIcon)

        assert_receiver_is_total_eq : function(self:LuaCursorIcon)

        __tostring : function(self:LuaCursorIcon):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaCursorLeft

        userdata
    
    --

        window : LuaEntity

        clone : function(self:LuaCursorLeft):(LuaCursorLeft)

        assert_receiver_is_total_eq : function(self:LuaCursorLeft)

        __tostring : function(self:LuaCursorLeft):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaCursorMoved

        userdata
    
    --

        window : LuaEntity

        position : LuaVec2

        delta : ReflectedValue

        window : LuaEntity

        position : LuaVec2

        delta : ReflectedValue

        clone : function(self:LuaCursorMoved):(LuaCursorMoved)

        __tostring : function(self:LuaCursorMoved):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaFileDragAndDrop

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaFileDragAndDrop)

        clone : function(self:LuaFileDragAndDrop):(LuaFileDragAndDrop)

        __tostring : function(self:LuaFileDragAndDrop):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaIme

        userdata
    
    --

        clone : function(self:LuaIme):(LuaIme)

        assert_receiver_is_total_eq : function(self:LuaIme)

        __tostring : function(self:LuaIme):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaMonitorSelection

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaMonitorSelection)

        clone : function(self:LuaMonitorSelection):(LuaMonitorSelection)

        __tostring : function(self:LuaMonitorSelection):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaReceivedCharacter

        userdata
    
    --

        window : LuaEntity

        char : LuaSmolStr

        window : LuaEntity

        char : LuaSmolStr

        clone : function(self:LuaReceivedCharacter):(LuaReceivedCharacter)

        assert_receiver_is_total_eq : function(self:LuaReceivedCharacter)

        __tostring : function(self:LuaReceivedCharacter):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindow

        userdata
    
    --

        cursor : LuaCursor

        present_mode : LuaPresentMode

        mode : LuaWindowMode

        position : LuaWindowPosition

        resolution : LuaWindowResolution

        title : string

        name : string

        composite_alpha_mode : LuaCompositeAlphaMode

        resize_constraints : LuaWindowResizeConstraints

        resizable : boolean

        enabled_buttons : LuaEnabledButtons

        decorations : boolean

        transparent : boolean

        focused : boolean

        window_level : LuaWindowLevel

        canvas : string

        fit_canvas_to_parent : boolean

        prevent_default_event_handling : boolean

        internal : LuaInternalWindowState

        ime_enabled : boolean

        ime_position : LuaVec2

        window_theme : ReflectedValue

        visible : boolean

        skip_taskbar : boolean

        desired_maximum_frame_latency : ReflectedValue

        recognize_pinch_gesture : boolean

        recognize_rotation_gesture : boolean

        recognize_doubletap_gesture : boolean

        recognize_pan_gesture : ReflectedValue

        cursor : LuaCursor

        present_mode : LuaPresentMode

        mode : LuaWindowMode

        position : LuaWindowPosition

        resolution : LuaWindowResolution

        title : string

        name : string

        composite_alpha_mode : LuaCompositeAlphaMode

        resize_constraints : LuaWindowResizeConstraints

        resizable : boolean

        enabled_buttons : LuaEnabledButtons

        decorations : boolean

        transparent : boolean

        focused : boolean

        window_level : LuaWindowLevel

        canvas : string

        fit_canvas_to_parent : boolean

        prevent_default_event_handling : boolean

        internal : LuaInternalWindowState

        ime_enabled : boolean

        ime_position : LuaVec2

        window_theme : ReflectedValue

        visible : boolean

        skip_taskbar : boolean

        desired_maximum_frame_latency : ReflectedValue

        recognize_pinch_gesture : boolean

        recognize_rotation_gesture : boolean

        recognize_doubletap_gesture : boolean

        recognize_pan_gesture : ReflectedValue

        clone : function(self:LuaWindow):(LuaWindow)

        width : function(self:LuaWindow):(number)

        height : function(self:LuaWindow):(number)

        size : function(self:LuaWindow):(LuaVec2)

        physical_width : function(self:LuaWindow):(integer)

        physical_height : function(self:LuaWindow):(integer)

        physical_size : function(self:LuaWindow):(LuaUVec2)

        scale_factor : function(self:LuaWindow):(number)

        set_maximized : function(self:LuaWindow , boolean)

        set_minimized : function(self:LuaWindow , boolean)

        __tostring : function(self:LuaWindow):(string)

    end
    
    
    record LuaWindowMoved

        userdata
    
    --

        window : LuaEntity

        position : LuaIVec2

        window : LuaEntity

        position : LuaIVec2

        assert_receiver_is_total_eq : function(self:LuaWindowMoved)

        clone : function(self:LuaWindowMoved):(LuaWindowMoved)

        __tostring : function(self:LuaWindowMoved):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowPosition

        userdata
    
    --

        clone : function(self:LuaWindowPosition):(LuaWindowPosition)

        set : function(self:LuaWindowPosition , LuaIVec2)

        center : function(self:LuaWindowPosition , LuaMonitorSelection)

        new : function(LuaIVec2):(LuaWindowPosition)

        __tostring : function(self:LuaWindowPosition):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaWindowPosition

        userdata
    
    --Collection of static methods for [``].

        new : function(LuaIVec2):(LuaWindowPosition)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowResizeConstraints

        userdata
    
    --

        min_width : number

        min_height : number

        max_width : number

        max_height : number

        min_width : number

        min_height : number

        max_width : number

        max_height : number

        clone : function(self:LuaWindowResizeConstraints):(LuaWindowResizeConstraints)

        check_constraints : function(self:LuaWindowResizeConstraints):(LuaWindowResizeConstraints)

        __tostring : function(self:LuaWindowResizeConstraints):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowResized

        userdata
    
    --

        window : LuaEntity

        width : number

        height : number

        window : LuaEntity

        width : number

        height : number

        clone : function(self:LuaWindowResized):(LuaWindowResized)

        __tostring : function(self:LuaWindowResized):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowCreated

        userdata
    
    --

        window : LuaEntity

        assert_receiver_is_total_eq : function(self:LuaWindowCreated)

        clone : function(self:LuaWindowCreated):(LuaWindowCreated)

        __tostring : function(self:LuaWindowCreated):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowClosing

        userdata
    
    --

        window : LuaEntity

        clone : function(self:LuaWindowClosing):(LuaWindowClosing)

        assert_receiver_is_total_eq : function(self:LuaWindowClosing)

        __tostring : function(self:LuaWindowClosing):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowClosed

        userdata
    
    --

        window : LuaEntity

        clone : function(self:LuaWindowClosed):(LuaWindowClosed)

        assert_receiver_is_total_eq : function(self:LuaWindowClosed)

        __tostring : function(self:LuaWindowClosed):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowCloseRequested

        userdata
    
    --

        window : LuaEntity

        assert_receiver_is_total_eq : function(self:LuaWindowCloseRequested)

        clone : function(self:LuaWindowCloseRequested):(LuaWindowCloseRequested)

        __tostring : function(self:LuaWindowCloseRequested):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowDestroyed

        userdata
    
    --

        window : LuaEntity

        clone : function(self:LuaWindowDestroyed):(LuaWindowDestroyed)

        assert_receiver_is_total_eq : function(self:LuaWindowDestroyed)

        __tostring : function(self:LuaWindowDestroyed):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaRequestRedraw

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaRequestRedraw)

        clone : function(self:LuaRequestRedraw):(LuaRequestRedraw)

        __tostring : function(self:LuaRequestRedraw):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowFocused

        userdata
    
    --

        window : LuaEntity

        focused : boolean

        window : LuaEntity

        focused : boolean

        clone : function(self:LuaWindowFocused):(LuaWindowFocused)

        assert_receiver_is_total_eq : function(self:LuaWindowFocused)

        __tostring : function(self:LuaWindowFocused):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowOccluded

        userdata
    
    --

        window : LuaEntity

        occluded : boolean

        window : LuaEntity

        occluded : boolean

        clone : function(self:LuaWindowOccluded):(LuaWindowOccluded)

        assert_receiver_is_total_eq : function(self:LuaWindowOccluded)

        __tostring : function(self:LuaWindowOccluded):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowScaleFactorChanged

        userdata
    
    --

        window : LuaEntity

        scale_factor : number

        window : LuaEntity

        scale_factor : number

        clone : function(self:LuaWindowScaleFactorChanged):(LuaWindowScaleFactorChanged)

        __tostring : function(self:LuaWindowScaleFactorChanged):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowBackendScaleFactorChanged

        userdata
    
    --

        window : LuaEntity

        scale_factor : number

        window : LuaEntity

        scale_factor : number

        clone : function(self:LuaWindowBackendScaleFactorChanged):(LuaWindowBackendScaleFactorChanged)

        __tostring : function(self:LuaWindowBackendScaleFactorChanged):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowThemeChanged

        userdata
    
    --

        window : LuaEntity

        theme : LuaWindowTheme

        window : LuaEntity

        theme : LuaWindowTheme

        assert_receiver_is_total_eq : function(self:LuaWindowThemeChanged)

        clone : function(self:LuaWindowThemeChanged):(LuaWindowThemeChanged)

        __tostring : function(self:LuaWindowThemeChanged):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaAppLifecycle

        userdata
    
    --

        clone : function(self:LuaAppLifecycle):(LuaAppLifecycle)

        assert_receiver_is_total_eq : function(self:LuaAppLifecycle)

        is_active : function(self:LuaAppLifecycle):(boolean)

        __tostring : function(self:LuaAppLifecycle):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaPrimaryWindow

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaPrimaryWindow)

        clone : function(self:LuaPrimaryWindow):(LuaPrimaryWindow)

        __tostring : function(self:LuaPrimaryWindow):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowTheme

        userdata
    
    --

        clone : function(self:LuaWindowTheme):(LuaWindowTheme)

        assert_receiver_is_total_eq : function(self:LuaWindowTheme)

        __tostring : function(self:LuaWindowTheme):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowRef

        userdata
    
    --

        clone : function(self:LuaWindowRef):(LuaWindowRef)

        __tostring : function(self:LuaWindowRef):(string)

    end
    
    
    record LuaNormalizedWindowRef

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaNormalizedWindowRef)

        entity : function(self:LuaNormalizedWindowRef):(LuaEntity)

        clone : function(self:LuaNormalizedWindowRef):(LuaNormalizedWindowRef)

        __tostring : function(self:LuaNormalizedWindowRef):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaCursor

        userdata
    
    --

        icon : LuaCursorIcon

        visible : boolean

        grab_mode : LuaCursorGrabMode

        hit_test : boolean

        icon : LuaCursorIcon

        visible : boolean

        grab_mode : LuaCursorGrabMode

        hit_test : boolean

        clone : function(self:LuaCursor):(LuaCursor)

        __tostring : function(self:LuaCursor):(string)

    end
    
    
    record LuaPresentMode

        userdata
    
    --

        clone : function(self:LuaPresentMode):(LuaPresentMode)

        assert_receiver_is_total_eq : function(self:LuaPresentMode)

        __tostring : function(self:LuaPresentMode):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowMode

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaWindowMode)

        clone : function(self:LuaWindowMode):(LuaWindowMode)

        __tostring : function(self:LuaWindowMode):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowResolution

        userdata
    
    --

        clone : function(self:LuaWindowResolution):(LuaWindowResolution)

        with_scale_factor_override : function(self:LuaWindowResolution , number):(LuaWindowResolution)

        width : function(self:LuaWindowResolution):(number)

        height : function(self:LuaWindowResolution):(number)

        size : function(self:LuaWindowResolution):(LuaVec2)

        physical_width : function(self:LuaWindowResolution):(integer)

        physical_height : function(self:LuaWindowResolution):(integer)

        physical_size : function(self:LuaWindowResolution):(LuaUVec2)

        scale_factor : function(self:LuaWindowResolution):(number)

        base_scale_factor : function(self:LuaWindowResolution):(number)

        scale_factor_override : function(self:LuaWindowResolution):(number)

        set : function(self:LuaWindowResolution , number , number)

        set_physical_resolution : function(self:LuaWindowResolution , integer , integer)

        set_scale_factor : function(self:LuaWindowResolution , number)

        set_scale_factor_and_apply_to_physical_size : function(self:LuaWindowResolution , number)

        set_scale_factor_override : function(self:LuaWindowResolution , number)

        new : function(number , number):(LuaWindowResolution)

        __tostring : function(self:LuaWindowResolution):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaWindowResolution

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number):(LuaWindowResolution)

        __eq : function(any , any):(any)

    end
    
    
    record LuaCompositeAlphaMode

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaCompositeAlphaMode)

        clone : function(self:LuaCompositeAlphaMode):(LuaCompositeAlphaMode)

        __tostring : function(self:LuaCompositeAlphaMode):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaEnabledButtons

        userdata
    
    --

        minimize : boolean

        maximize : boolean

        close : boolean

        minimize : boolean

        maximize : boolean

        close : boolean

        clone : function(self:LuaEnabledButtons):(LuaEnabledButtons)

        __tostring : function(self:LuaEnabledButtons):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaWindowLevel

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaWindowLevel)

        clone : function(self:LuaWindowLevel):(LuaWindowLevel)

        __tostring : function(self:LuaWindowLevel):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaInternalWindowState

        userdata
    
    --

        clone : function(self:LuaInternalWindowState):(LuaInternalWindowState)

        take_maximize_request : function(self:LuaInternalWindowState):(boolean)

        take_minimize_request : function(self:LuaInternalWindowState):(boolean)

        __tostring : function(self:LuaInternalWindowState):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaCursorGrabMode

        userdata
    
    --

        clone : function(self:LuaCursorGrabMode):(LuaCursorGrabMode)

        assert_receiver_is_total_eq : function(self:LuaCursorGrabMode)

        __tostring : function(self:LuaCursorGrabMode):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaDuration

        userdata
    
    --

        is_zero : function(self:LuaDuration):(boolean)

        as_secs : function(self:LuaDuration):(integer)

        subsec_millis : function(self:LuaDuration):(integer)

        subsec_micros : function(self:LuaDuration):(integer)

        subsec_nanos : function(self:LuaDuration):(integer)

        as_millis : function(self:LuaDuration):(integer)

        as_micros : function(self:LuaDuration):(integer)

        as_nanos : function(self:LuaDuration):(integer)

        saturating_add : function(self:LuaDuration , LuaDuration):(LuaDuration)

        saturating_sub : function(self:LuaDuration , LuaDuration):(LuaDuration)

        saturating_mul : function(self:LuaDuration , integer):(LuaDuration)

        as_secs_f64 : function(self:LuaDuration):(number)

        as_secs_f32 : function(self:LuaDuration):(number)

        mul_f64 : function(self:LuaDuration , number):(LuaDuration)

        mul_f32 : function(self:LuaDuration , number):(LuaDuration)

        div_f64 : function(self:LuaDuration , number):(LuaDuration)

        div_f32 : function(self:LuaDuration , number):(LuaDuration)

        clone : function(self:LuaDuration):(LuaDuration)

        assert_receiver_is_total_eq : function(self:LuaDuration)

        new : function(integer , integer):(LuaDuration)

        from_secs : function(integer):(LuaDuration)

        from_millis : function(integer):(LuaDuration)

        from_micros : function(integer):(LuaDuration)

        from_nanos : function(integer):(LuaDuration)

        from_secs_f64 : function(number):(LuaDuration)

        from_secs_f32 : function(number):(LuaDuration)

        __tostring : function(self:LuaDuration):(string)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __div : function(any , any):(any)

        __sub : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaDuration

        userdata
    
    --Collection of static methods for [``].

        new : function(integer , integer):(LuaDuration)

        from_secs : function(integer):(LuaDuration)

        from_millis : function(integer):(LuaDuration)

        from_micros : function(integer):(LuaDuration)

        from_nanos : function(integer):(LuaDuration)

        from_secs_f64 : function(number):(LuaDuration)

        from_secs_f32 : function(number):(LuaDuration)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __div : function(any , any):(any)

        __sub : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record LuaInstant

        userdata
    
    --

        clone : function(self:LuaInstant):(LuaInstant)

        assert_receiver_is_total_eq : function(self:LuaInstant)

        duration_since : function(self:LuaInstant , LuaInstant):(LuaDuration)

        saturating_duration_since : function(self:LuaInstant , LuaInstant):(LuaDuration)

        elapsed : function(self:LuaInstant):(LuaDuration)

        now : function():(LuaInstant)

        __tostring : function(self:LuaInstant):(string)

        __eq : function(any , any):(any)

        __sub : function(any , any):(any)

        __add : function(any , any):(any)

    end
    
    
    record ClassLuaInstant

        userdata
    
    --Collection of static methods for [``].

        now : function():(LuaInstant)

        __eq : function(any , any):(any)

        __sub : function(any , any):(any)

        __add : function(any , any):(any)

    end
    
    
    record LuaPathBuf

        userdata
    
    --

        clone : function(self:LuaPathBuf):(LuaPathBuf)

        capacity : function(self:LuaPathBuf):(integer)

        clone_from : function(self:LuaPathBuf , LuaPathBuf)

        pop : function(self:LuaPathBuf):(boolean)

        clear : function(self:LuaPathBuf)

        reserve : function(self:LuaPathBuf , integer)

        reserve_exact : function(self:LuaPathBuf , integer)

        shrink_to_fit : function(self:LuaPathBuf)

        shrink_to : function(self:LuaPathBuf , integer)

        new : function():(LuaPathBuf)

        with_capacity : function(integer):(LuaPathBuf)

        __tostring : function(self:LuaPathBuf):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaPathBuf

        userdata
    
    --Collection of static methods for [``].

        new : function():(LuaPathBuf)

        with_capacity : function(integer):(LuaPathBuf)

        __eq : function(any , any):(any)

    end
    
    
    record LuaRangeFull

        userdata
    
    --

        assert_receiver_is_total_eq : function(self:LuaRangeFull)

        clone : function(self:LuaRangeFull):(LuaRangeFull)

        __tostring : function(self:LuaRangeFull):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaQuat

        userdata
    
    --

        clone : function(self:LuaQuat):(LuaQuat)

        to_scaled_axis : function(self:LuaQuat):(LuaVec3)

        to_euler : function(self:LuaQuat , LuaEulerRot):(number , number , number)

        to_array : function(self:LuaQuat):({number})

        xyz : function(self:LuaQuat):(LuaVec3)

        conjugate : function(self:LuaQuat):(LuaQuat)

        inverse : function(self:LuaQuat):(LuaQuat)

        dot : function(self:LuaQuat , LuaQuat):(number)

        length : function(self:LuaQuat):(number)

        length_squared : function(self:LuaQuat):(number)

        length_recip : function(self:LuaQuat):(number)

        normalize : function(self:LuaQuat):(LuaQuat)

        is_finite : function(self:LuaQuat):(boolean)

        is_nan : function(self:LuaQuat):(boolean)

        is_normalized : function(self:LuaQuat):(boolean)

        is_near_identity : function(self:LuaQuat):(boolean)

        angle_between : function(self:LuaQuat , LuaQuat):(number)

        abs_diff_eq : function(self:LuaQuat , LuaQuat , number):(boolean)

        lerp : function(self:LuaQuat , LuaQuat , number):(LuaQuat)

        slerp : function(self:LuaQuat , LuaQuat , number):(LuaQuat)

        mul_vec3 : function(self:LuaQuat , LuaVec3):(LuaVec3)

        mul_quat : function(self:LuaQuat , LuaQuat):(LuaQuat)

        mul_vec3a : function(self:LuaQuat , LuaVec3A):(LuaVec3A)

        as_dquat : function(self:LuaQuat):(LuaDQuat)

        as_f64 : function(self:LuaQuat):(LuaDQuat)

        from_xyzw : function(number , number , number , number):(LuaQuat)

        from_array : function({number}):(LuaQuat)

        from_vec4 : function(LuaVec4):(LuaQuat)

        from_axis_angle : function(LuaVec3 , number):(LuaQuat)

        from_scaled_axis : function(LuaVec3):(LuaQuat)

        from_rotation_x : function(number):(LuaQuat)

        from_rotation_y : function(number):(LuaQuat)

        from_rotation_z : function(number):(LuaQuat)

        from_euler : function(LuaEulerRot , number , number , number):(LuaQuat)

        from_mat3 : function(LuaMat3):(LuaQuat)

        from_mat3a : function(LuaMat3A):(LuaQuat)

        from_mat4 : function(LuaMat4):(LuaQuat)

        from_rotation_arc : function(LuaVec3 , LuaVec3):(LuaQuat)

        from_rotation_arc_colinear : function(LuaVec3 , LuaVec3):(LuaQuat)

        from_rotation_arc_2d : function(LuaVec2 , LuaVec2):(LuaQuat)

        from_affine3 : function(LuaAffine3A):(LuaQuat)

        __tostring : function(self:LuaQuat):(string)

        __sub : function(any , any):(any)

        __unm : function(any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __eq : function(any , any):(any)

        __div : function(any , any):(any)

    end
    
    
    record ClassLuaQuat

        userdata
    
    --Collection of static methods for [``].

        from_xyzw : function(number , number , number , number):(LuaQuat)

        from_array : function({number}):(LuaQuat)

        from_vec4 : function(LuaVec4):(LuaQuat)

        from_axis_angle : function(LuaVec3 , number):(LuaQuat)

        from_scaled_axis : function(LuaVec3):(LuaQuat)

        from_rotation_x : function(number):(LuaQuat)

        from_rotation_y : function(number):(LuaQuat)

        from_rotation_z : function(number):(LuaQuat)

        from_euler : function(LuaEulerRot , number , number , number):(LuaQuat)

        from_mat3 : function(LuaMat3):(LuaQuat)

        from_mat3a : function(LuaMat3A):(LuaQuat)

        from_mat4 : function(LuaMat4):(LuaQuat)

        from_rotation_arc : function(LuaVec3 , LuaVec3):(LuaQuat)

        from_rotation_arc_colinear : function(LuaVec3 , LuaVec3):(LuaQuat)

        from_rotation_arc_2d : function(LuaVec2 , LuaVec2):(LuaQuat)

        from_affine3 : function(LuaAffine3A):(LuaQuat)

        __sub : function(any , any):(any)

        __unm : function(any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __eq : function(any , any):(any)

        __div : function(any , any):(any)

    end
    
    
    record LuaVec3

        userdata
    
    --

        x : number

        y : number

        z : number

        x : number

        y : number

        z : number

        to_array : function(self:LuaVec3):({number})

        extend : function(self:LuaVec3 , number):(LuaVec4)

        truncate : function(self:LuaVec3):(LuaVec2)

        with_x : function(self:LuaVec3 , number):(LuaVec3)

        with_y : function(self:LuaVec3 , number):(LuaVec3)

        with_z : function(self:LuaVec3 , number):(LuaVec3)

        dot : function(self:LuaVec3 , LuaVec3):(number)

        dot_into_vec : function(self:LuaVec3 , LuaVec3):(LuaVec3)

        cross : function(self:LuaVec3 , LuaVec3):(LuaVec3)

        min : function(self:LuaVec3 , LuaVec3):(LuaVec3)

        max : function(self:LuaVec3 , LuaVec3):(LuaVec3)

        clamp : function(self:LuaVec3 , LuaVec3 , LuaVec3):(LuaVec3)

        min_element : function(self:LuaVec3):(number)

        max_element : function(self:LuaVec3):(number)

        element_sum : function(self:LuaVec3):(number)

        element_product : function(self:LuaVec3):(number)

        cmpeq : function(self:LuaVec3 , LuaVec3):(LuaBVec3)

        cmpne : function(self:LuaVec3 , LuaVec3):(LuaBVec3)

        cmpge : function(self:LuaVec3 , LuaVec3):(LuaBVec3)

        cmpgt : function(self:LuaVec3 , LuaVec3):(LuaBVec3)

        cmple : function(self:LuaVec3 , LuaVec3):(LuaBVec3)

        cmplt : function(self:LuaVec3 , LuaVec3):(LuaBVec3)

        abs : function(self:LuaVec3):(LuaVec3)

        signum : function(self:LuaVec3):(LuaVec3)

        copysign : function(self:LuaVec3 , LuaVec3):(LuaVec3)

        is_negative_bitmask : function(self:LuaVec3):(integer)

        is_finite : function(self:LuaVec3):(boolean)

        is_nan : function(self:LuaVec3):(boolean)

        is_nan_mask : function(self:LuaVec3):(LuaBVec3)

        length : function(self:LuaVec3):(number)

        length_squared : function(self:LuaVec3):(number)

        length_recip : function(self:LuaVec3):(number)

        distance : function(self:LuaVec3 , LuaVec3):(number)

        distance_squared : function(self:LuaVec3 , LuaVec3):(number)

        div_euclid : function(self:LuaVec3 , LuaVec3):(LuaVec3)

        rem_euclid : function(self:LuaVec3 , LuaVec3):(LuaVec3)

        normalize : function(self:LuaVec3):(LuaVec3)

        normalize_or : function(self:LuaVec3 , LuaVec3):(LuaVec3)

        normalize_or_zero : function(self:LuaVec3):(LuaVec3)

        is_normalized : function(self:LuaVec3):(boolean)

        project_onto : function(self:LuaVec3 , LuaVec3):(LuaVec3)

        reject_from : function(self:LuaVec3 , LuaVec3):(LuaVec3)

        project_onto_normalized : function(self:LuaVec3 , LuaVec3):(LuaVec3)

        reject_from_normalized : function(self:LuaVec3 , LuaVec3):(LuaVec3)

        round : function(self:LuaVec3):(LuaVec3)

        floor : function(self:LuaVec3):(LuaVec3)

        ceil : function(self:LuaVec3):(LuaVec3)

        trunc : function(self:LuaVec3):(LuaVec3)

        fract : function(self:LuaVec3):(LuaVec3)

        fract_gl : function(self:LuaVec3):(LuaVec3)

        exp : function(self:LuaVec3):(LuaVec3)

        powf : function(self:LuaVec3 , number):(LuaVec3)

        recip : function(self:LuaVec3):(LuaVec3)

        lerp : function(self:LuaVec3 , LuaVec3 , number):(LuaVec3)

        move_towards : function(self:LuaVec3 , LuaVec3 , number):(LuaVec3)

        midpoint : function(self:LuaVec3 , LuaVec3):(LuaVec3)

        abs_diff_eq : function(self:LuaVec3 , LuaVec3 , number):(boolean)

        clamp_length : function(self:LuaVec3 , number , number):(LuaVec3)

        clamp_length_max : function(self:LuaVec3 , number):(LuaVec3)

        clamp_length_min : function(self:LuaVec3 , number):(LuaVec3)

        mul_add : function(self:LuaVec3 , LuaVec3 , LuaVec3):(LuaVec3)

        angle_between : function(self:LuaVec3 , LuaVec3):(number)

        any_orthogonal_vector : function(self:LuaVec3):(LuaVec3)

        any_orthonormal_vector : function(self:LuaVec3):(LuaVec3)

        as_dvec3 : function(self:LuaVec3):(LuaDVec3)

        as_ivec3 : function(self:LuaVec3):(LuaIVec3)

        as_uvec3 : function(self:LuaVec3):(LuaUVec3)

        as_i64vec3 : function(self:LuaVec3):(LuaI64Vec3)

        as_u64vec3 : function(self:LuaVec3):(LuaU64Vec3)

        clone : function(self:LuaVec3):(LuaVec3)

        new : function(number , number , number):(LuaVec3)

        splat : function(number):(LuaVec3)

        select : function(LuaBVec3 , LuaVec3 , LuaVec3):(LuaVec3)

        from_array : function({number}):(LuaVec3)

        __tostring : function(self:LuaVec3):(string)

        __index : function(self:LuaVec3 , integer):(number)

        __newindex : function(self:LuaVec3 , integer , number)

        __sub : function(any , any):(any)

        __mul : function(any , any):(any)

        __div : function(any , any):(any)

        __add : function(any , any):(any)

        __mod : function(any , any):(any)

        __eq : function(any , any):(any)

        __unm : function(any):(any)

    end
    
    
    record ClassLuaVec3

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number , number):(LuaVec3)

        splat : function(number):(LuaVec3)

        select : function(LuaBVec3 , LuaVec3 , LuaVec3):(LuaVec3)

        from_array : function({number}):(LuaVec3)

        __sub : function(any , any):(any)

        __mul : function(any , any):(any)

        __div : function(any , any):(any)

        __add : function(any , any):(any)

        __mod : function(any , any):(any)

        __eq : function(any , any):(any)

        __unm : function(any):(any)

    end
    
    
    record LuaIVec2

        userdata
    
    --

        x : integer

        y : integer

        x : integer

        y : integer

        to_array : function(self:LuaIVec2):({integer})

        extend : function(self:LuaIVec2 , integer):(LuaIVec3)

        with_x : function(self:LuaIVec2 , integer):(LuaIVec2)

        with_y : function(self:LuaIVec2 , integer):(LuaIVec2)

        dot : function(self:LuaIVec2 , LuaIVec2):(integer)

        dot_into_vec : function(self:LuaIVec2 , LuaIVec2):(LuaIVec2)

        min : function(self:LuaIVec2 , LuaIVec2):(LuaIVec2)

        max : function(self:LuaIVec2 , LuaIVec2):(LuaIVec2)

        clamp : function(self:LuaIVec2 , LuaIVec2 , LuaIVec2):(LuaIVec2)

        min_element : function(self:LuaIVec2):(integer)

        max_element : function(self:LuaIVec2):(integer)

        element_sum : function(self:LuaIVec2):(integer)

        element_product : function(self:LuaIVec2):(integer)

        cmpeq : function(self:LuaIVec2 , LuaIVec2):(LuaBVec2)

        cmpne : function(self:LuaIVec2 , LuaIVec2):(LuaBVec2)

        cmpge : function(self:LuaIVec2 , LuaIVec2):(LuaBVec2)

        cmpgt : function(self:LuaIVec2 , LuaIVec2):(LuaBVec2)

        cmple : function(self:LuaIVec2 , LuaIVec2):(LuaBVec2)

        cmplt : function(self:LuaIVec2 , LuaIVec2):(LuaBVec2)

        abs : function(self:LuaIVec2):(LuaIVec2)

        signum : function(self:LuaIVec2):(LuaIVec2)

        is_negative_bitmask : function(self:LuaIVec2):(integer)

        length_squared : function(self:LuaIVec2):(integer)

        distance_squared : function(self:LuaIVec2 , LuaIVec2):(integer)

        div_euclid : function(self:LuaIVec2 , LuaIVec2):(LuaIVec2)

        rem_euclid : function(self:LuaIVec2 , LuaIVec2):(LuaIVec2)

        perp : function(self:LuaIVec2):(LuaIVec2)

        perp_dot : function(self:LuaIVec2 , LuaIVec2):(integer)

        rotate : function(self:LuaIVec2 , LuaIVec2):(LuaIVec2)

        as_vec2 : function(self:LuaIVec2):(LuaVec2)

        as_dvec2 : function(self:LuaIVec2):(LuaDVec2)

        as_uvec2 : function(self:LuaIVec2):(LuaUVec2)

        as_i64vec2 : function(self:LuaIVec2):(LuaI64Vec2)

        as_u64vec2 : function(self:LuaIVec2):(LuaU64Vec2)

        wrapping_add : function(self:LuaIVec2 , LuaIVec2):(LuaIVec2)

        wrapping_sub : function(self:LuaIVec2 , LuaIVec2):(LuaIVec2)

        wrapping_mul : function(self:LuaIVec2 , LuaIVec2):(LuaIVec2)

        wrapping_div : function(self:LuaIVec2 , LuaIVec2):(LuaIVec2)

        saturating_add : function(self:LuaIVec2 , LuaIVec2):(LuaIVec2)

        saturating_sub : function(self:LuaIVec2 , LuaIVec2):(LuaIVec2)

        saturating_mul : function(self:LuaIVec2 , LuaIVec2):(LuaIVec2)

        saturating_div : function(self:LuaIVec2 , LuaIVec2):(LuaIVec2)

        wrapping_add_unsigned : function(self:LuaIVec2 , LuaUVec2):(LuaIVec2)

        wrapping_sub_unsigned : function(self:LuaIVec2 , LuaUVec2):(LuaIVec2)

        saturating_add_unsigned : function(self:LuaIVec2 , LuaUVec2):(LuaIVec2)

        saturating_sub_unsigned : function(self:LuaIVec2 , LuaUVec2):(LuaIVec2)

        clone : function(self:LuaIVec2):(LuaIVec2)

        assert_receiver_is_total_eq : function(self:LuaIVec2)

        new : function(integer , integer):(LuaIVec2)

        splat : function(integer):(LuaIVec2)

        select : function(LuaBVec2 , LuaIVec2 , LuaIVec2):(LuaIVec2)

        from_array : function({integer}):(LuaIVec2)

        __tostring : function(self:LuaIVec2):(string)

        __index : function(self:LuaIVec2 , integer):(integer)

        __newindex : function(self:LuaIVec2 , integer , integer)

        __add : function(any , any):(any)

        __unm : function(any):(any)

        __eq : function(any , any):(any)

        __sub : function(any , any):(any)

        __mul : function(any , any):(any)

        __div : function(any , any):(any)

        __mod : function(any , any):(any)

    end
    
    
    record ClassLuaIVec2

        userdata
    
    --Collection of static methods for [``].

        new : function(integer , integer):(LuaIVec2)

        splat : function(integer):(LuaIVec2)

        select : function(LuaBVec2 , LuaIVec2 , LuaIVec2):(LuaIVec2)

        from_array : function({integer}):(LuaIVec2)

        __add : function(any , any):(any)

        __unm : function(any):(any)

        __eq : function(any , any):(any)

        __sub : function(any , any):(any)

        __mul : function(any , any):(any)

        __div : function(any , any):(any)

        __mod : function(any , any):(any)

    end
    
    
    record LuaIVec3

        userdata
    
    --

        x : integer

        y : integer

        z : integer

        x : integer

        y : integer

        z : integer

        clone : function(self:LuaIVec3):(LuaIVec3)

        to_array : function(self:LuaIVec3):({integer})

        extend : function(self:LuaIVec3 , integer):(LuaIVec4)

        truncate : function(self:LuaIVec3):(LuaIVec2)

        with_x : function(self:LuaIVec3 , integer):(LuaIVec3)

        with_y : function(self:LuaIVec3 , integer):(LuaIVec3)

        with_z : function(self:LuaIVec3 , integer):(LuaIVec3)

        dot : function(self:LuaIVec3 , LuaIVec3):(integer)

        dot_into_vec : function(self:LuaIVec3 , LuaIVec3):(LuaIVec3)

        cross : function(self:LuaIVec3 , LuaIVec3):(LuaIVec3)

        min : function(self:LuaIVec3 , LuaIVec3):(LuaIVec3)

        max : function(self:LuaIVec3 , LuaIVec3):(LuaIVec3)

        clamp : function(self:LuaIVec3 , LuaIVec3 , LuaIVec3):(LuaIVec3)

        min_element : function(self:LuaIVec3):(integer)

        max_element : function(self:LuaIVec3):(integer)

        element_sum : function(self:LuaIVec3):(integer)

        element_product : function(self:LuaIVec3):(integer)

        cmpeq : function(self:LuaIVec3 , LuaIVec3):(LuaBVec3)

        cmpne : function(self:LuaIVec3 , LuaIVec3):(LuaBVec3)

        cmpge : function(self:LuaIVec3 , LuaIVec3):(LuaBVec3)

        cmpgt : function(self:LuaIVec3 , LuaIVec3):(LuaBVec3)

        cmple : function(self:LuaIVec3 , LuaIVec3):(LuaBVec3)

        cmplt : function(self:LuaIVec3 , LuaIVec3):(LuaBVec3)

        abs : function(self:LuaIVec3):(LuaIVec3)

        signum : function(self:LuaIVec3):(LuaIVec3)

        is_negative_bitmask : function(self:LuaIVec3):(integer)

        length_squared : function(self:LuaIVec3):(integer)

        distance_squared : function(self:LuaIVec3 , LuaIVec3):(integer)

        div_euclid : function(self:LuaIVec3 , LuaIVec3):(LuaIVec3)

        rem_euclid : function(self:LuaIVec3 , LuaIVec3):(LuaIVec3)

        as_vec3 : function(self:LuaIVec3):(LuaVec3)

        as_vec3a : function(self:LuaIVec3):(LuaVec3A)

        as_dvec3 : function(self:LuaIVec3):(LuaDVec3)

        as_uvec3 : function(self:LuaIVec3):(LuaUVec3)

        as_i64vec3 : function(self:LuaIVec3):(LuaI64Vec3)

        as_u64vec3 : function(self:LuaIVec3):(LuaU64Vec3)

        wrapping_add : function(self:LuaIVec3 , LuaIVec3):(LuaIVec3)

        wrapping_sub : function(self:LuaIVec3 , LuaIVec3):(LuaIVec3)

        wrapping_mul : function(self:LuaIVec3 , LuaIVec3):(LuaIVec3)

        wrapping_div : function(self:LuaIVec3 , LuaIVec3):(LuaIVec3)

        saturating_add : function(self:LuaIVec3 , LuaIVec3):(LuaIVec3)

        saturating_sub : function(self:LuaIVec3 , LuaIVec3):(LuaIVec3)

        saturating_mul : function(self:LuaIVec3 , LuaIVec3):(LuaIVec3)

        saturating_div : function(self:LuaIVec3 , LuaIVec3):(LuaIVec3)

        wrapping_add_unsigned : function(self:LuaIVec3 , LuaUVec3):(LuaIVec3)

        wrapping_sub_unsigned : function(self:LuaIVec3 , LuaUVec3):(LuaIVec3)

        saturating_add_unsigned : function(self:LuaIVec3 , LuaUVec3):(LuaIVec3)

        saturating_sub_unsigned : function(self:LuaIVec3 , LuaUVec3):(LuaIVec3)

        assert_receiver_is_total_eq : function(self:LuaIVec3)

        new : function(integer , integer , integer):(LuaIVec3)

        splat : function(integer):(LuaIVec3)

        select : function(LuaBVec3 , LuaIVec3 , LuaIVec3):(LuaIVec3)

        from_array : function({integer}):(LuaIVec3)

        __tostring : function(self:LuaIVec3):(string)

        __index : function(self:LuaIVec3 , integer):(integer)

        __newindex : function(self:LuaIVec3 , integer , integer)

        __add : function(any , any):(any)

        __sub : function(any , any):(any)

        __mod : function(any , any):(any)

        __mul : function(any , any):(any)

        __div : function(any , any):(any)

        __eq : function(any , any):(any)

        __unm : function(any):(any)

    end
    
    
    record ClassLuaIVec3

        userdata
    
    --Collection of static methods for [``].

        new : function(integer , integer , integer):(LuaIVec3)

        splat : function(integer):(LuaIVec3)

        select : function(LuaBVec3 , LuaIVec3 , LuaIVec3):(LuaIVec3)

        from_array : function({integer}):(LuaIVec3)

        __add : function(any , any):(any)

        __sub : function(any , any):(any)

        __mod : function(any , any):(any)

        __mul : function(any , any):(any)

        __div : function(any , any):(any)

        __eq : function(any , any):(any)

        __unm : function(any):(any)

    end
    
    
    record LuaIVec4

        userdata
    
    --

        x : integer

        y : integer

        z : integer

        w : integer

        x : integer

        y : integer

        z : integer

        w : integer

        to_array : function(self:LuaIVec4):({integer})

        truncate : function(self:LuaIVec4):(LuaIVec3)

        with_x : function(self:LuaIVec4 , integer):(LuaIVec4)

        with_y : function(self:LuaIVec4 , integer):(LuaIVec4)

        with_z : function(self:LuaIVec4 , integer):(LuaIVec4)

        with_w : function(self:LuaIVec4 , integer):(LuaIVec4)

        dot : function(self:LuaIVec4 , LuaIVec4):(integer)

        dot_into_vec : function(self:LuaIVec4 , LuaIVec4):(LuaIVec4)

        min : function(self:LuaIVec4 , LuaIVec4):(LuaIVec4)

        max : function(self:LuaIVec4 , LuaIVec4):(LuaIVec4)

        clamp : function(self:LuaIVec4 , LuaIVec4 , LuaIVec4):(LuaIVec4)

        min_element : function(self:LuaIVec4):(integer)

        max_element : function(self:LuaIVec4):(integer)

        element_sum : function(self:LuaIVec4):(integer)

        element_product : function(self:LuaIVec4):(integer)

        cmpeq : function(self:LuaIVec4 , LuaIVec4):(LuaBVec4)

        cmpne : function(self:LuaIVec4 , LuaIVec4):(LuaBVec4)

        cmpge : function(self:LuaIVec4 , LuaIVec4):(LuaBVec4)

        cmpgt : function(self:LuaIVec4 , LuaIVec4):(LuaBVec4)

        cmple : function(self:LuaIVec4 , LuaIVec4):(LuaBVec4)

        cmplt : function(self:LuaIVec4 , LuaIVec4):(LuaBVec4)

        abs : function(self:LuaIVec4):(LuaIVec4)

        signum : function(self:LuaIVec4):(LuaIVec4)

        is_negative_bitmask : function(self:LuaIVec4):(integer)

        length_squared : function(self:LuaIVec4):(integer)

        distance_squared : function(self:LuaIVec4 , LuaIVec4):(integer)

        div_euclid : function(self:LuaIVec4 , LuaIVec4):(LuaIVec4)

        rem_euclid : function(self:LuaIVec4 , LuaIVec4):(LuaIVec4)

        as_vec4 : function(self:LuaIVec4):(LuaVec4)

        as_dvec4 : function(self:LuaIVec4):(LuaDVec4)

        as_uvec4 : function(self:LuaIVec4):(LuaUVec4)

        as_i64vec4 : function(self:LuaIVec4):(LuaI64Vec4)

        as_u64vec4 : function(self:LuaIVec4):(LuaU64Vec4)

        wrapping_add : function(self:LuaIVec4 , LuaIVec4):(LuaIVec4)

        wrapping_sub : function(self:LuaIVec4 , LuaIVec4):(LuaIVec4)

        wrapping_mul : function(self:LuaIVec4 , LuaIVec4):(LuaIVec4)

        wrapping_div : function(self:LuaIVec4 , LuaIVec4):(LuaIVec4)

        saturating_add : function(self:LuaIVec4 , LuaIVec4):(LuaIVec4)

        saturating_sub : function(self:LuaIVec4 , LuaIVec4):(LuaIVec4)

        saturating_mul : function(self:LuaIVec4 , LuaIVec4):(LuaIVec4)

        saturating_div : function(self:LuaIVec4 , LuaIVec4):(LuaIVec4)

        wrapping_add_unsigned : function(self:LuaIVec4 , LuaUVec4):(LuaIVec4)

        wrapping_sub_unsigned : function(self:LuaIVec4 , LuaUVec4):(LuaIVec4)

        saturating_add_unsigned : function(self:LuaIVec4 , LuaUVec4):(LuaIVec4)

        saturating_sub_unsigned : function(self:LuaIVec4 , LuaUVec4):(LuaIVec4)

        clone : function(self:LuaIVec4):(LuaIVec4)

        assert_receiver_is_total_eq : function(self:LuaIVec4)

        new : function(integer , integer , integer , integer):(LuaIVec4)

        splat : function(integer):(LuaIVec4)

        select : function(LuaBVec4 , LuaIVec4 , LuaIVec4):(LuaIVec4)

        from_array : function({integer}):(LuaIVec4)

        __tostring : function(self:LuaIVec4):(string)

        __index : function(self:LuaIVec4 , integer):(integer)

        __newindex : function(self:LuaIVec4 , integer , integer)

        __div : function(any , any):(any)

        __mod : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __sub : function(any , any):(any)

        __eq : function(any , any):(any)

        __unm : function(any):(any)

    end
    
    
    record ClassLuaIVec4

        userdata
    
    --Collection of static methods for [``].

        new : function(integer , integer , integer , integer):(LuaIVec4)

        splat : function(integer):(LuaIVec4)

        select : function(LuaBVec4 , LuaIVec4 , LuaIVec4):(LuaIVec4)

        from_array : function({integer}):(LuaIVec4)

        __div : function(any , any):(any)

        __mod : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __sub : function(any , any):(any)

        __eq : function(any , any):(any)

        __unm : function(any):(any)

    end
    
    
    record LuaI64Vec2

        userdata
    
    --

        x : integer

        y : integer

        x : integer

        y : integer

        clone : function(self:LuaI64Vec2):(LuaI64Vec2)

        to_array : function(self:LuaI64Vec2):({integer})

        extend : function(self:LuaI64Vec2 , integer):(LuaI64Vec3)

        with_x : function(self:LuaI64Vec2 , integer):(LuaI64Vec2)

        with_y : function(self:LuaI64Vec2 , integer):(LuaI64Vec2)

        dot : function(self:LuaI64Vec2 , LuaI64Vec2):(integer)

        dot_into_vec : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        min : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        max : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        clamp : function(self:LuaI64Vec2 , LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        min_element : function(self:LuaI64Vec2):(integer)

        max_element : function(self:LuaI64Vec2):(integer)

        element_sum : function(self:LuaI64Vec2):(integer)

        element_product : function(self:LuaI64Vec2):(integer)

        cmpeq : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaBVec2)

        cmpne : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaBVec2)

        cmpge : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaBVec2)

        cmpgt : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaBVec2)

        cmple : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaBVec2)

        cmplt : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaBVec2)

        abs : function(self:LuaI64Vec2):(LuaI64Vec2)

        signum : function(self:LuaI64Vec2):(LuaI64Vec2)

        is_negative_bitmask : function(self:LuaI64Vec2):(integer)

        length_squared : function(self:LuaI64Vec2):(integer)

        distance_squared : function(self:LuaI64Vec2 , LuaI64Vec2):(integer)

        div_euclid : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        rem_euclid : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        perp : function(self:LuaI64Vec2):(LuaI64Vec2)

        perp_dot : function(self:LuaI64Vec2 , LuaI64Vec2):(integer)

        rotate : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        as_vec2 : function(self:LuaI64Vec2):(LuaVec2)

        as_dvec2 : function(self:LuaI64Vec2):(LuaDVec2)

        as_ivec2 : function(self:LuaI64Vec2):(LuaIVec2)

        as_uvec2 : function(self:LuaI64Vec2):(LuaUVec2)

        as_u64vec2 : function(self:LuaI64Vec2):(LuaU64Vec2)

        wrapping_add : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        wrapping_sub : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        wrapping_mul : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        wrapping_div : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        saturating_add : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        saturating_sub : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        saturating_mul : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        saturating_div : function(self:LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        wrapping_add_unsigned : function(self:LuaI64Vec2 , LuaU64Vec2):(LuaI64Vec2)

        wrapping_sub_unsigned : function(self:LuaI64Vec2 , LuaU64Vec2):(LuaI64Vec2)

        saturating_add_unsigned : function(self:LuaI64Vec2 , LuaU64Vec2):(LuaI64Vec2)

        saturating_sub_unsigned : function(self:LuaI64Vec2 , LuaU64Vec2):(LuaI64Vec2)

        assert_receiver_is_total_eq : function(self:LuaI64Vec2)

        new : function(integer , integer):(LuaI64Vec2)

        splat : function(integer):(LuaI64Vec2)

        select : function(LuaBVec2 , LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        from_array : function({integer}):(LuaI64Vec2)

        __tostring : function(self:LuaI64Vec2):(string)

        __sub : function(any , any):(any)

        __eq : function(any , any):(any)

        __mod : function(any , any):(any)

        __add : function(any , any):(any)

        __unm : function(any):(any)

        __div : function(any , any):(any)

        __mul : function(any , any):(any)

    end
    
    
    record ClassLuaI64Vec2

        userdata
    
    --Collection of static methods for [``].

        new : function(integer , integer):(LuaI64Vec2)

        splat : function(integer):(LuaI64Vec2)

        select : function(LuaBVec2 , LuaI64Vec2 , LuaI64Vec2):(LuaI64Vec2)

        from_array : function({integer}):(LuaI64Vec2)

        __sub : function(any , any):(any)

        __eq : function(any , any):(any)

        __mod : function(any , any):(any)

        __add : function(any , any):(any)

        __unm : function(any):(any)

        __div : function(any , any):(any)

        __mul : function(any , any):(any)

    end
    
    
    record LuaI64Vec3

        userdata
    
    --

        x : integer

        y : integer

        z : integer

        x : integer

        y : integer

        z : integer

        clone : function(self:LuaI64Vec3):(LuaI64Vec3)

        assert_receiver_is_total_eq : function(self:LuaI64Vec3)

        to_array : function(self:LuaI64Vec3):({integer})

        extend : function(self:LuaI64Vec3 , integer):(LuaI64Vec4)

        truncate : function(self:LuaI64Vec3):(LuaI64Vec2)

        with_x : function(self:LuaI64Vec3 , integer):(LuaI64Vec3)

        with_y : function(self:LuaI64Vec3 , integer):(LuaI64Vec3)

        with_z : function(self:LuaI64Vec3 , integer):(LuaI64Vec3)

        dot : function(self:LuaI64Vec3 , LuaI64Vec3):(integer)

        dot_into_vec : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        cross : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        min : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        max : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        clamp : function(self:LuaI64Vec3 , LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        min_element : function(self:LuaI64Vec3):(integer)

        max_element : function(self:LuaI64Vec3):(integer)

        element_sum : function(self:LuaI64Vec3):(integer)

        element_product : function(self:LuaI64Vec3):(integer)

        cmpeq : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaBVec3)

        cmpne : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaBVec3)

        cmpge : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaBVec3)

        cmpgt : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaBVec3)

        cmple : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaBVec3)

        cmplt : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaBVec3)

        abs : function(self:LuaI64Vec3):(LuaI64Vec3)

        signum : function(self:LuaI64Vec3):(LuaI64Vec3)

        is_negative_bitmask : function(self:LuaI64Vec3):(integer)

        length_squared : function(self:LuaI64Vec3):(integer)

        distance_squared : function(self:LuaI64Vec3 , LuaI64Vec3):(integer)

        div_euclid : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        rem_euclid : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        as_vec3 : function(self:LuaI64Vec3):(LuaVec3)

        as_vec3a : function(self:LuaI64Vec3):(LuaVec3A)

        as_dvec3 : function(self:LuaI64Vec3):(LuaDVec3)

        as_ivec3 : function(self:LuaI64Vec3):(LuaIVec3)

        as_uvec3 : function(self:LuaI64Vec3):(LuaUVec3)

        as_u64vec3 : function(self:LuaI64Vec3):(LuaU64Vec3)

        wrapping_add : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        wrapping_sub : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        wrapping_mul : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        wrapping_div : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        saturating_add : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        saturating_sub : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        saturating_mul : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        saturating_div : function(self:LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        wrapping_add_unsigned : function(self:LuaI64Vec3 , LuaU64Vec3):(LuaI64Vec3)

        wrapping_sub_unsigned : function(self:LuaI64Vec3 , LuaU64Vec3):(LuaI64Vec3)

        saturating_add_unsigned : function(self:LuaI64Vec3 , LuaU64Vec3):(LuaI64Vec3)

        saturating_sub_unsigned : function(self:LuaI64Vec3 , LuaU64Vec3):(LuaI64Vec3)

        new : function(integer , integer , integer):(LuaI64Vec3)

        splat : function(integer):(LuaI64Vec3)

        select : function(LuaBVec3 , LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        from_array : function({integer}):(LuaI64Vec3)

        __tostring : function(self:LuaI64Vec3):(string)

        __sub : function(any , any):(any)

        __unm : function(any):(any)

        __div : function(any , any):(any)

        __eq : function(any , any):(any)

        __mod : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

    end
    
    
    record ClassLuaI64Vec3

        userdata
    
    --Collection of static methods for [``].

        new : function(integer , integer , integer):(LuaI64Vec3)

        splat : function(integer):(LuaI64Vec3)

        select : function(LuaBVec3 , LuaI64Vec3 , LuaI64Vec3):(LuaI64Vec3)

        from_array : function({integer}):(LuaI64Vec3)

        __sub : function(any , any):(any)

        __unm : function(any):(any)

        __div : function(any , any):(any)

        __eq : function(any , any):(any)

        __mod : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

    end
    
    
    record LuaI64Vec4

        userdata
    
    --

        x : integer

        y : integer

        z : integer

        w : integer

        x : integer

        y : integer

        z : integer

        w : integer

        to_array : function(self:LuaI64Vec4):({integer})

        truncate : function(self:LuaI64Vec4):(LuaI64Vec3)

        with_x : function(self:LuaI64Vec4 , integer):(LuaI64Vec4)

        with_y : function(self:LuaI64Vec4 , integer):(LuaI64Vec4)

        with_z : function(self:LuaI64Vec4 , integer):(LuaI64Vec4)

        with_w : function(self:LuaI64Vec4 , integer):(LuaI64Vec4)

        dot : function(self:LuaI64Vec4 , LuaI64Vec4):(integer)

        dot_into_vec : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaI64Vec4)

        min : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaI64Vec4)

        max : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaI64Vec4)

        clamp : function(self:LuaI64Vec4 , LuaI64Vec4 , LuaI64Vec4):(LuaI64Vec4)

        min_element : function(self:LuaI64Vec4):(integer)

        max_element : function(self:LuaI64Vec4):(integer)

        element_sum : function(self:LuaI64Vec4):(integer)

        element_product : function(self:LuaI64Vec4):(integer)

        cmpeq : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaBVec4)

        cmpne : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaBVec4)

        cmpge : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaBVec4)

        cmpgt : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaBVec4)

        cmple : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaBVec4)

        cmplt : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaBVec4)

        abs : function(self:LuaI64Vec4):(LuaI64Vec4)

        signum : function(self:LuaI64Vec4):(LuaI64Vec4)

        is_negative_bitmask : function(self:LuaI64Vec4):(integer)

        length_squared : function(self:LuaI64Vec4):(integer)

        distance_squared : function(self:LuaI64Vec4 , LuaI64Vec4):(integer)

        div_euclid : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaI64Vec4)

        rem_euclid : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaI64Vec4)

        as_vec4 : function(self:LuaI64Vec4):(LuaVec4)

        as_dvec4 : function(self:LuaI64Vec4):(LuaDVec4)

        as_ivec4 : function(self:LuaI64Vec4):(LuaIVec4)

        as_uvec4 : function(self:LuaI64Vec4):(LuaUVec4)

        as_u64vec4 : function(self:LuaI64Vec4):(LuaU64Vec4)

        wrapping_add : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaI64Vec4)

        wrapping_sub : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaI64Vec4)

        wrapping_mul : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaI64Vec4)

        wrapping_div : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaI64Vec4)

        saturating_add : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaI64Vec4)

        saturating_sub : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaI64Vec4)

        saturating_mul : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaI64Vec4)

        saturating_div : function(self:LuaI64Vec4 , LuaI64Vec4):(LuaI64Vec4)

        wrapping_add_unsigned : function(self:LuaI64Vec4 , LuaU64Vec4):(LuaI64Vec4)

        wrapping_sub_unsigned : function(self:LuaI64Vec4 , LuaU64Vec4):(LuaI64Vec4)

        saturating_add_unsigned : function(self:LuaI64Vec4 , LuaU64Vec4):(LuaI64Vec4)

        saturating_sub_unsigned : function(self:LuaI64Vec4 , LuaU64Vec4):(LuaI64Vec4)

        assert_receiver_is_total_eq : function(self:LuaI64Vec4)

        clone : function(self:LuaI64Vec4):(LuaI64Vec4)

        new : function(integer , integer , integer , integer):(LuaI64Vec4)

        splat : function(integer):(LuaI64Vec4)

        select : function(LuaBVec4 , LuaI64Vec4 , LuaI64Vec4):(LuaI64Vec4)

        from_array : function({integer}):(LuaI64Vec4)

        __tostring : function(self:LuaI64Vec4):(string)

        __sub : function(any , any):(any)

        __mod : function(any , any):(any)

        __eq : function(any , any):(any)

        __div : function(any , any):(any)

        __unm : function(any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

    end
    
    
    record ClassLuaI64Vec4

        userdata
    
    --Collection of static methods for [``].

        new : function(integer , integer , integer , integer):(LuaI64Vec4)

        splat : function(integer):(LuaI64Vec4)

        select : function(LuaBVec4 , LuaI64Vec4 , LuaI64Vec4):(LuaI64Vec4)

        from_array : function({integer}):(LuaI64Vec4)

        __sub : function(any , any):(any)

        __mod : function(any , any):(any)

        __eq : function(any , any):(any)

        __div : function(any , any):(any)

        __unm : function(any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

    end
    
    
    record LuaUVec2

        userdata
    
    --

        x : integer

        y : integer

        x : integer

        y : integer

        assert_receiver_is_total_eq : function(self:LuaUVec2)

        to_array : function(self:LuaUVec2):({integer})

        extend : function(self:LuaUVec2 , integer):(LuaUVec3)

        with_x : function(self:LuaUVec2 , integer):(LuaUVec2)

        with_y : function(self:LuaUVec2 , integer):(LuaUVec2)

        dot : function(self:LuaUVec2 , LuaUVec2):(integer)

        dot_into_vec : function(self:LuaUVec2 , LuaUVec2):(LuaUVec2)

        min : function(self:LuaUVec2 , LuaUVec2):(LuaUVec2)

        max : function(self:LuaUVec2 , LuaUVec2):(LuaUVec2)

        clamp : function(self:LuaUVec2 , LuaUVec2 , LuaUVec2):(LuaUVec2)

        min_element : function(self:LuaUVec2):(integer)

        max_element : function(self:LuaUVec2):(integer)

        element_sum : function(self:LuaUVec2):(integer)

        element_product : function(self:LuaUVec2):(integer)

        cmpeq : function(self:LuaUVec2 , LuaUVec2):(LuaBVec2)

        cmpne : function(self:LuaUVec2 , LuaUVec2):(LuaBVec2)

        cmpge : function(self:LuaUVec2 , LuaUVec2):(LuaBVec2)

        cmpgt : function(self:LuaUVec2 , LuaUVec2):(LuaBVec2)

        cmple : function(self:LuaUVec2 , LuaUVec2):(LuaBVec2)

        cmplt : function(self:LuaUVec2 , LuaUVec2):(LuaBVec2)

        length_squared : function(self:LuaUVec2):(integer)

        as_vec2 : function(self:LuaUVec2):(LuaVec2)

        as_dvec2 : function(self:LuaUVec2):(LuaDVec2)

        as_ivec2 : function(self:LuaUVec2):(LuaIVec2)

        as_i64vec2 : function(self:LuaUVec2):(LuaI64Vec2)

        as_u64vec2 : function(self:LuaUVec2):(LuaU64Vec2)

        wrapping_add : function(self:LuaUVec2 , LuaUVec2):(LuaUVec2)

        wrapping_sub : function(self:LuaUVec2 , LuaUVec2):(LuaUVec2)

        wrapping_mul : function(self:LuaUVec2 , LuaUVec2):(LuaUVec2)

        wrapping_div : function(self:LuaUVec2 , LuaUVec2):(LuaUVec2)

        saturating_add : function(self:LuaUVec2 , LuaUVec2):(LuaUVec2)

        saturating_sub : function(self:LuaUVec2 , LuaUVec2):(LuaUVec2)

        saturating_mul : function(self:LuaUVec2 , LuaUVec2):(LuaUVec2)

        saturating_div : function(self:LuaUVec2 , LuaUVec2):(LuaUVec2)

        wrapping_add_signed : function(self:LuaUVec2 , LuaIVec2):(LuaUVec2)

        saturating_add_signed : function(self:LuaUVec2 , LuaIVec2):(LuaUVec2)

        clone : function(self:LuaUVec2):(LuaUVec2)

        new : function(integer , integer):(LuaUVec2)

        splat : function(integer):(LuaUVec2)

        select : function(LuaBVec2 , LuaUVec2 , LuaUVec2):(LuaUVec2)

        from_array : function({integer}):(LuaUVec2)

        __tostring : function(self:LuaUVec2):(string)

        __index : function(self:LuaUVec2 , integer):(integer)

        __newindex : function(self:LuaUVec2 , integer , integer)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __eq : function(any , any):(any)

        __div : function(any , any):(any)

        __sub : function(any , any):(any)

        __mod : function(any , any):(any)

    end
    
    
    record ClassLuaUVec2

        userdata
    
    --Collection of static methods for [``].

        new : function(integer , integer):(LuaUVec2)

        splat : function(integer):(LuaUVec2)

        select : function(LuaBVec2 , LuaUVec2 , LuaUVec2):(LuaUVec2)

        from_array : function({integer}):(LuaUVec2)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __eq : function(any , any):(any)

        __div : function(any , any):(any)

        __sub : function(any , any):(any)

        __mod : function(any , any):(any)

    end
    
    
    record LuaUVec3

        userdata
    
    --

        x : integer

        y : integer

        z : integer

        x : integer

        y : integer

        z : integer

        clone : function(self:LuaUVec3):(LuaUVec3)

        assert_receiver_is_total_eq : function(self:LuaUVec3)

        to_array : function(self:LuaUVec3):({integer})

        extend : function(self:LuaUVec3 , integer):(LuaUVec4)

        truncate : function(self:LuaUVec3):(LuaUVec2)

        with_x : function(self:LuaUVec3 , integer):(LuaUVec3)

        with_y : function(self:LuaUVec3 , integer):(LuaUVec3)

        with_z : function(self:LuaUVec3 , integer):(LuaUVec3)

        dot : function(self:LuaUVec3 , LuaUVec3):(integer)

        dot_into_vec : function(self:LuaUVec3 , LuaUVec3):(LuaUVec3)

        cross : function(self:LuaUVec3 , LuaUVec3):(LuaUVec3)

        min : function(self:LuaUVec3 , LuaUVec3):(LuaUVec3)

        max : function(self:LuaUVec3 , LuaUVec3):(LuaUVec3)

        clamp : function(self:LuaUVec3 , LuaUVec3 , LuaUVec3):(LuaUVec3)

        min_element : function(self:LuaUVec3):(integer)

        max_element : function(self:LuaUVec3):(integer)

        element_sum : function(self:LuaUVec3):(integer)

        element_product : function(self:LuaUVec3):(integer)

        cmpeq : function(self:LuaUVec3 , LuaUVec3):(LuaBVec3)

        cmpne : function(self:LuaUVec3 , LuaUVec3):(LuaBVec3)

        cmpge : function(self:LuaUVec3 , LuaUVec3):(LuaBVec3)

        cmpgt : function(self:LuaUVec3 , LuaUVec3):(LuaBVec3)

        cmple : function(self:LuaUVec3 , LuaUVec3):(LuaBVec3)

        cmplt : function(self:LuaUVec3 , LuaUVec3):(LuaBVec3)

        length_squared : function(self:LuaUVec3):(integer)

        as_vec3 : function(self:LuaUVec3):(LuaVec3)

        as_vec3a : function(self:LuaUVec3):(LuaVec3A)

        as_dvec3 : function(self:LuaUVec3):(LuaDVec3)

        as_ivec3 : function(self:LuaUVec3):(LuaIVec3)

        as_i64vec3 : function(self:LuaUVec3):(LuaI64Vec3)

        as_u64vec3 : function(self:LuaUVec3):(LuaU64Vec3)

        wrapping_add : function(self:LuaUVec3 , LuaUVec3):(LuaUVec3)

        wrapping_sub : function(self:LuaUVec3 , LuaUVec3):(LuaUVec3)

        wrapping_mul : function(self:LuaUVec3 , LuaUVec3):(LuaUVec3)

        wrapping_div : function(self:LuaUVec3 , LuaUVec3):(LuaUVec3)

        saturating_add : function(self:LuaUVec3 , LuaUVec3):(LuaUVec3)

        saturating_sub : function(self:LuaUVec3 , LuaUVec3):(LuaUVec3)

        saturating_mul : function(self:LuaUVec3 , LuaUVec3):(LuaUVec3)

        saturating_div : function(self:LuaUVec3 , LuaUVec3):(LuaUVec3)

        wrapping_add_signed : function(self:LuaUVec3 , LuaIVec3):(LuaUVec3)

        saturating_add_signed : function(self:LuaUVec3 , LuaIVec3):(LuaUVec3)

        new : function(integer , integer , integer):(LuaUVec3)

        splat : function(integer):(LuaUVec3)

        select : function(LuaBVec3 , LuaUVec3 , LuaUVec3):(LuaUVec3)

        from_array : function({integer}):(LuaUVec3)

        __tostring : function(self:LuaUVec3):(string)

        __index : function(self:LuaUVec3 , integer):(integer)

        __newindex : function(self:LuaUVec3 , integer , integer)

        __sub : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __div : function(any , any):(any)

        __mod : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaUVec3

        userdata
    
    --Collection of static methods for [``].

        new : function(integer , integer , integer):(LuaUVec3)

        splat : function(integer):(LuaUVec3)

        select : function(LuaBVec3 , LuaUVec3 , LuaUVec3):(LuaUVec3)

        from_array : function({integer}):(LuaUVec3)

        __sub : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __div : function(any , any):(any)

        __mod : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record LuaUVec4

        userdata
    
    --

        x : integer

        y : integer

        z : integer

        w : integer

        x : integer

        y : integer

        z : integer

        w : integer

        clone : function(self:LuaUVec4):(LuaUVec4)

        assert_receiver_is_total_eq : function(self:LuaUVec4)

        to_array : function(self:LuaUVec4):({integer})

        truncate : function(self:LuaUVec4):(LuaUVec3)

        with_x : function(self:LuaUVec4 , integer):(LuaUVec4)

        with_y : function(self:LuaUVec4 , integer):(LuaUVec4)

        with_z : function(self:LuaUVec4 , integer):(LuaUVec4)

        with_w : function(self:LuaUVec4 , integer):(LuaUVec4)

        dot : function(self:LuaUVec4 , LuaUVec4):(integer)

        dot_into_vec : function(self:LuaUVec4 , LuaUVec4):(LuaUVec4)

        min : function(self:LuaUVec4 , LuaUVec4):(LuaUVec4)

        max : function(self:LuaUVec4 , LuaUVec4):(LuaUVec4)

        clamp : function(self:LuaUVec4 , LuaUVec4 , LuaUVec4):(LuaUVec4)

        min_element : function(self:LuaUVec4):(integer)

        max_element : function(self:LuaUVec4):(integer)

        element_sum : function(self:LuaUVec4):(integer)

        element_product : function(self:LuaUVec4):(integer)

        cmpeq : function(self:LuaUVec4 , LuaUVec4):(LuaBVec4)

        cmpne : function(self:LuaUVec4 , LuaUVec4):(LuaBVec4)

        cmpge : function(self:LuaUVec4 , LuaUVec4):(LuaBVec4)

        cmpgt : function(self:LuaUVec4 , LuaUVec4):(LuaBVec4)

        cmple : function(self:LuaUVec4 , LuaUVec4):(LuaBVec4)

        cmplt : function(self:LuaUVec4 , LuaUVec4):(LuaBVec4)

        length_squared : function(self:LuaUVec4):(integer)

        as_vec4 : function(self:LuaUVec4):(LuaVec4)

        as_dvec4 : function(self:LuaUVec4):(LuaDVec4)

        as_ivec4 : function(self:LuaUVec4):(LuaIVec4)

        as_i64vec4 : function(self:LuaUVec4):(LuaI64Vec4)

        as_u64vec4 : function(self:LuaUVec4):(LuaU64Vec4)

        wrapping_add : function(self:LuaUVec4 , LuaUVec4):(LuaUVec4)

        wrapping_sub : function(self:LuaUVec4 , LuaUVec4):(LuaUVec4)

        wrapping_mul : function(self:LuaUVec4 , LuaUVec4):(LuaUVec4)

        wrapping_div : function(self:LuaUVec4 , LuaUVec4):(LuaUVec4)

        saturating_add : function(self:LuaUVec4 , LuaUVec4):(LuaUVec4)

        saturating_sub : function(self:LuaUVec4 , LuaUVec4):(LuaUVec4)

        saturating_mul : function(self:LuaUVec4 , LuaUVec4):(LuaUVec4)

        saturating_div : function(self:LuaUVec4 , LuaUVec4):(LuaUVec4)

        wrapping_add_signed : function(self:LuaUVec4 , LuaIVec4):(LuaUVec4)

        saturating_add_signed : function(self:LuaUVec4 , LuaIVec4):(LuaUVec4)

        new : function(integer , integer , integer , integer):(LuaUVec4)

        splat : function(integer):(LuaUVec4)

        select : function(LuaBVec4 , LuaUVec4 , LuaUVec4):(LuaUVec4)

        from_array : function({integer}):(LuaUVec4)

        __tostring : function(self:LuaUVec4):(string)

        __index : function(self:LuaUVec4 , integer):(integer)

        __newindex : function(self:LuaUVec4 , integer , integer)

        __eq : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __div : function(any , any):(any)

        __sub : function(any , any):(any)

        __mod : function(any , any):(any)

    end
    
    
    record ClassLuaUVec4

        userdata
    
    --Collection of static methods for [``].

        new : function(integer , integer , integer , integer):(LuaUVec4)

        splat : function(integer):(LuaUVec4)

        select : function(LuaBVec4 , LuaUVec4 , LuaUVec4):(LuaUVec4)

        from_array : function({integer}):(LuaUVec4)

        __eq : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __div : function(any , any):(any)

        __sub : function(any , any):(any)

        __mod : function(any , any):(any)

    end
    
    
    record LuaU64Vec2

        userdata
    
    --

        x : integer

        y : integer

        x : integer

        y : integer

        clone : function(self:LuaU64Vec2):(LuaU64Vec2)

        assert_receiver_is_total_eq : function(self:LuaU64Vec2)

        to_array : function(self:LuaU64Vec2):({integer})

        extend : function(self:LuaU64Vec2 , integer):(LuaU64Vec3)

        with_x : function(self:LuaU64Vec2 , integer):(LuaU64Vec2)

        with_y : function(self:LuaU64Vec2 , integer):(LuaU64Vec2)

        dot : function(self:LuaU64Vec2 , LuaU64Vec2):(integer)

        dot_into_vec : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaU64Vec2)

        min : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaU64Vec2)

        max : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaU64Vec2)

        clamp : function(self:LuaU64Vec2 , LuaU64Vec2 , LuaU64Vec2):(LuaU64Vec2)

        min_element : function(self:LuaU64Vec2):(integer)

        max_element : function(self:LuaU64Vec2):(integer)

        element_sum : function(self:LuaU64Vec2):(integer)

        element_product : function(self:LuaU64Vec2):(integer)

        cmpeq : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaBVec2)

        cmpne : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaBVec2)

        cmpge : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaBVec2)

        cmpgt : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaBVec2)

        cmple : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaBVec2)

        cmplt : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaBVec2)

        length_squared : function(self:LuaU64Vec2):(integer)

        as_vec2 : function(self:LuaU64Vec2):(LuaVec2)

        as_dvec2 : function(self:LuaU64Vec2):(LuaDVec2)

        as_ivec2 : function(self:LuaU64Vec2):(LuaIVec2)

        as_uvec2 : function(self:LuaU64Vec2):(LuaUVec2)

        as_i64vec2 : function(self:LuaU64Vec2):(LuaI64Vec2)

        wrapping_add : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaU64Vec2)

        wrapping_sub : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaU64Vec2)

        wrapping_mul : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaU64Vec2)

        wrapping_div : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaU64Vec2)

        saturating_add : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaU64Vec2)

        saturating_sub : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaU64Vec2)

        saturating_mul : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaU64Vec2)

        saturating_div : function(self:LuaU64Vec2 , LuaU64Vec2):(LuaU64Vec2)

        wrapping_add_signed : function(self:LuaU64Vec2 , LuaI64Vec2):(LuaU64Vec2)

        saturating_add_signed : function(self:LuaU64Vec2 , LuaI64Vec2):(LuaU64Vec2)

        new : function(integer , integer):(LuaU64Vec2)

        splat : function(integer):(LuaU64Vec2)

        select : function(LuaBVec2 , LuaU64Vec2 , LuaU64Vec2):(LuaU64Vec2)

        from_array : function({integer}):(LuaU64Vec2)

        __tostring : function(self:LuaU64Vec2):(string)

        __div : function(any , any):(any)

        __mul : function(any , any):(any)

        __eq : function(any , any):(any)

        __add : function(any , any):(any)

        __sub : function(any , any):(any)

        __mod : function(any , any):(any)

    end
    
    
    record ClassLuaU64Vec2

        userdata
    
    --Collection of static methods for [``].

        new : function(integer , integer):(LuaU64Vec2)

        splat : function(integer):(LuaU64Vec2)

        select : function(LuaBVec2 , LuaU64Vec2 , LuaU64Vec2):(LuaU64Vec2)

        from_array : function({integer}):(LuaU64Vec2)

        __div : function(any , any):(any)

        __mul : function(any , any):(any)

        __eq : function(any , any):(any)

        __add : function(any , any):(any)

        __sub : function(any , any):(any)

        __mod : function(any , any):(any)

    end
    
    
    record LuaU64Vec3

        userdata
    
    --

        x : integer

        y : integer

        z : integer

        x : integer

        y : integer

        z : integer

        clone : function(self:LuaU64Vec3):(LuaU64Vec3)

        to_array : function(self:LuaU64Vec3):({integer})

        extend : function(self:LuaU64Vec3 , integer):(LuaU64Vec4)

        truncate : function(self:LuaU64Vec3):(LuaU64Vec2)

        with_x : function(self:LuaU64Vec3 , integer):(LuaU64Vec3)

        with_y : function(self:LuaU64Vec3 , integer):(LuaU64Vec3)

        with_z : function(self:LuaU64Vec3 , integer):(LuaU64Vec3)

        dot : function(self:LuaU64Vec3 , LuaU64Vec3):(integer)

        dot_into_vec : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaU64Vec3)

        cross : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaU64Vec3)

        min : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaU64Vec3)

        max : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaU64Vec3)

        clamp : function(self:LuaU64Vec3 , LuaU64Vec3 , LuaU64Vec3):(LuaU64Vec3)

        min_element : function(self:LuaU64Vec3):(integer)

        max_element : function(self:LuaU64Vec3):(integer)

        element_sum : function(self:LuaU64Vec3):(integer)

        element_product : function(self:LuaU64Vec3):(integer)

        cmpeq : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaBVec3)

        cmpne : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaBVec3)

        cmpge : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaBVec3)

        cmpgt : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaBVec3)

        cmple : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaBVec3)

        cmplt : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaBVec3)

        length_squared : function(self:LuaU64Vec3):(integer)

        as_vec3 : function(self:LuaU64Vec3):(LuaVec3)

        as_vec3a : function(self:LuaU64Vec3):(LuaVec3A)

        as_dvec3 : function(self:LuaU64Vec3):(LuaDVec3)

        as_ivec3 : function(self:LuaU64Vec3):(LuaIVec3)

        as_uvec3 : function(self:LuaU64Vec3):(LuaUVec3)

        as_i64vec3 : function(self:LuaU64Vec3):(LuaI64Vec3)

        wrapping_add : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaU64Vec3)

        wrapping_sub : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaU64Vec3)

        wrapping_mul : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaU64Vec3)

        wrapping_div : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaU64Vec3)

        saturating_add : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaU64Vec3)

        saturating_sub : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaU64Vec3)

        saturating_mul : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaU64Vec3)

        saturating_div : function(self:LuaU64Vec3 , LuaU64Vec3):(LuaU64Vec3)

        wrapping_add_signed : function(self:LuaU64Vec3 , LuaI64Vec3):(LuaU64Vec3)

        saturating_add_signed : function(self:LuaU64Vec3 , LuaI64Vec3):(LuaU64Vec3)

        assert_receiver_is_total_eq : function(self:LuaU64Vec3)

        new : function(integer , integer , integer):(LuaU64Vec3)

        splat : function(integer):(LuaU64Vec3)

        select : function(LuaBVec3 , LuaU64Vec3 , LuaU64Vec3):(LuaU64Vec3)

        from_array : function({integer}):(LuaU64Vec3)

        __tostring : function(self:LuaU64Vec3):(string)

        __sub : function(any , any):(any)

        __mod : function(any , any):(any)

        __eq : function(any , any):(any)

        __div : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

    end
    
    
    record ClassLuaU64Vec3

        userdata
    
    --Collection of static methods for [``].

        new : function(integer , integer , integer):(LuaU64Vec3)

        splat : function(integer):(LuaU64Vec3)

        select : function(LuaBVec3 , LuaU64Vec3 , LuaU64Vec3):(LuaU64Vec3)

        from_array : function({integer}):(LuaU64Vec3)

        __sub : function(any , any):(any)

        __mod : function(any , any):(any)

        __eq : function(any , any):(any)

        __div : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

    end
    
    
    record LuaU64Vec4

        userdata
    
    --

        x : integer

        y : integer

        z : integer

        w : integer

        x : integer

        y : integer

        z : integer

        w : integer

        clone : function(self:LuaU64Vec4):(LuaU64Vec4)

        to_array : function(self:LuaU64Vec4):({integer})

        truncate : function(self:LuaU64Vec4):(LuaU64Vec3)

        with_x : function(self:LuaU64Vec4 , integer):(LuaU64Vec4)

        with_y : function(self:LuaU64Vec4 , integer):(LuaU64Vec4)

        with_z : function(self:LuaU64Vec4 , integer):(LuaU64Vec4)

        with_w : function(self:LuaU64Vec4 , integer):(LuaU64Vec4)

        dot : function(self:LuaU64Vec4 , LuaU64Vec4):(integer)

        dot_into_vec : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaU64Vec4)

        min : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaU64Vec4)

        max : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaU64Vec4)

        clamp : function(self:LuaU64Vec4 , LuaU64Vec4 , LuaU64Vec4):(LuaU64Vec4)

        min_element : function(self:LuaU64Vec4):(integer)

        max_element : function(self:LuaU64Vec4):(integer)

        element_sum : function(self:LuaU64Vec4):(integer)

        element_product : function(self:LuaU64Vec4):(integer)

        cmpeq : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaBVec4)

        cmpne : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaBVec4)

        cmpge : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaBVec4)

        cmpgt : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaBVec4)

        cmple : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaBVec4)

        cmplt : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaBVec4)

        length_squared : function(self:LuaU64Vec4):(integer)

        as_vec4 : function(self:LuaU64Vec4):(LuaVec4)

        as_dvec4 : function(self:LuaU64Vec4):(LuaDVec4)

        as_ivec4 : function(self:LuaU64Vec4):(LuaIVec4)

        as_uvec4 : function(self:LuaU64Vec4):(LuaUVec4)

        as_i64vec4 : function(self:LuaU64Vec4):(LuaI64Vec4)

        wrapping_add : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaU64Vec4)

        wrapping_sub : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaU64Vec4)

        wrapping_mul : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaU64Vec4)

        wrapping_div : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaU64Vec4)

        saturating_add : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaU64Vec4)

        saturating_sub : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaU64Vec4)

        saturating_mul : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaU64Vec4)

        saturating_div : function(self:LuaU64Vec4 , LuaU64Vec4):(LuaU64Vec4)

        wrapping_add_signed : function(self:LuaU64Vec4 , LuaI64Vec4):(LuaU64Vec4)

        saturating_add_signed : function(self:LuaU64Vec4 , LuaI64Vec4):(LuaU64Vec4)

        assert_receiver_is_total_eq : function(self:LuaU64Vec4)

        new : function(integer , integer , integer , integer):(LuaU64Vec4)

        splat : function(integer):(LuaU64Vec4)

        select : function(LuaBVec4 , LuaU64Vec4 , LuaU64Vec4):(LuaU64Vec4)

        from_array : function({integer}):(LuaU64Vec4)

        __tostring : function(self:LuaU64Vec4):(string)

        __mul : function(any , any):(any)

        __div : function(any , any):(any)

        __mod : function(any , any):(any)

        __eq : function(any , any):(any)

        __add : function(any , any):(any)

        __sub : function(any , any):(any)

    end
    
    
    record ClassLuaU64Vec4

        userdata
    
    --Collection of static methods for [``].

        new : function(integer , integer , integer , integer):(LuaU64Vec4)

        splat : function(integer):(LuaU64Vec4)

        select : function(LuaBVec4 , LuaU64Vec4 , LuaU64Vec4):(LuaU64Vec4)

        from_array : function({integer}):(LuaU64Vec4)

        __mul : function(any , any):(any)

        __div : function(any , any):(any)

        __mod : function(any , any):(any)

        __eq : function(any , any):(any)

        __add : function(any , any):(any)

        __sub : function(any , any):(any)

    end
    
    
    record LuaVec2

        userdata
    
    --

        x : number

        y : number

        x : number

        y : number

        clone : function(self:LuaVec2):(LuaVec2)

        to_array : function(self:LuaVec2):({number})

        extend : function(self:LuaVec2 , number):(LuaVec3)

        with_x : function(self:LuaVec2 , number):(LuaVec2)

        with_y : function(self:LuaVec2 , number):(LuaVec2)

        dot : function(self:LuaVec2 , LuaVec2):(number)

        dot_into_vec : function(self:LuaVec2 , LuaVec2):(LuaVec2)

        min : function(self:LuaVec2 , LuaVec2):(LuaVec2)

        max : function(self:LuaVec2 , LuaVec2):(LuaVec2)

        clamp : function(self:LuaVec2 , LuaVec2 , LuaVec2):(LuaVec2)

        min_element : function(self:LuaVec2):(number)

        max_element : function(self:LuaVec2):(number)

        element_sum : function(self:LuaVec2):(number)

        element_product : function(self:LuaVec2):(number)

        cmpeq : function(self:LuaVec2 , LuaVec2):(LuaBVec2)

        cmpne : function(self:LuaVec2 , LuaVec2):(LuaBVec2)

        cmpge : function(self:LuaVec2 , LuaVec2):(LuaBVec2)

        cmpgt : function(self:LuaVec2 , LuaVec2):(LuaBVec2)

        cmple : function(self:LuaVec2 , LuaVec2):(LuaBVec2)

        cmplt : function(self:LuaVec2 , LuaVec2):(LuaBVec2)

        abs : function(self:LuaVec2):(LuaVec2)

        signum : function(self:LuaVec2):(LuaVec2)

        copysign : function(self:LuaVec2 , LuaVec2):(LuaVec2)

        is_negative_bitmask : function(self:LuaVec2):(integer)

        is_finite : function(self:LuaVec2):(boolean)

        is_nan : function(self:LuaVec2):(boolean)

        is_nan_mask : function(self:LuaVec2):(LuaBVec2)

        length : function(self:LuaVec2):(number)

        length_squared : function(self:LuaVec2):(number)

        length_recip : function(self:LuaVec2):(number)

        distance : function(self:LuaVec2 , LuaVec2):(number)

        distance_squared : function(self:LuaVec2 , LuaVec2):(number)

        div_euclid : function(self:LuaVec2 , LuaVec2):(LuaVec2)

        rem_euclid : function(self:LuaVec2 , LuaVec2):(LuaVec2)

        normalize : function(self:LuaVec2):(LuaVec2)

        normalize_or : function(self:LuaVec2 , LuaVec2):(LuaVec2)

        normalize_or_zero : function(self:LuaVec2):(LuaVec2)

        is_normalized : function(self:LuaVec2):(boolean)

        project_onto : function(self:LuaVec2 , LuaVec2):(LuaVec2)

        reject_from : function(self:LuaVec2 , LuaVec2):(LuaVec2)

        project_onto_normalized : function(self:LuaVec2 , LuaVec2):(LuaVec2)

        reject_from_normalized : function(self:LuaVec2 , LuaVec2):(LuaVec2)

        round : function(self:LuaVec2):(LuaVec2)

        floor : function(self:LuaVec2):(LuaVec2)

        ceil : function(self:LuaVec2):(LuaVec2)

        trunc : function(self:LuaVec2):(LuaVec2)

        fract : function(self:LuaVec2):(LuaVec2)

        fract_gl : function(self:LuaVec2):(LuaVec2)

        exp : function(self:LuaVec2):(LuaVec2)

        powf : function(self:LuaVec2 , number):(LuaVec2)

        recip : function(self:LuaVec2):(LuaVec2)

        lerp : function(self:LuaVec2 , LuaVec2 , number):(LuaVec2)

        move_towards : function(self:LuaVec2 , LuaVec2 , number):(LuaVec2)

        midpoint : function(self:LuaVec2 , LuaVec2):(LuaVec2)

        abs_diff_eq : function(self:LuaVec2 , LuaVec2 , number):(boolean)

        clamp_length : function(self:LuaVec2 , number , number):(LuaVec2)

        clamp_length_max : function(self:LuaVec2 , number):(LuaVec2)

        clamp_length_min : function(self:LuaVec2 , number):(LuaVec2)

        mul_add : function(self:LuaVec2 , LuaVec2 , LuaVec2):(LuaVec2)

        to_angle : function(self:LuaVec2):(number)

        angle_between : function(self:LuaVec2 , LuaVec2):(number)

        perp : function(self:LuaVec2):(LuaVec2)

        perp_dot : function(self:LuaVec2 , LuaVec2):(number)

        rotate : function(self:LuaVec2 , LuaVec2):(LuaVec2)

        as_dvec2 : function(self:LuaVec2):(LuaDVec2)

        as_ivec2 : function(self:LuaVec2):(LuaIVec2)

        as_uvec2 : function(self:LuaVec2):(LuaUVec2)

        as_i64vec2 : function(self:LuaVec2):(LuaI64Vec2)

        as_u64vec2 : function(self:LuaVec2):(LuaU64Vec2)

        new : function(number , number):(LuaVec2)

        splat : function(number):(LuaVec2)

        select : function(LuaBVec2 , LuaVec2 , LuaVec2):(LuaVec2)

        from_array : function({number}):(LuaVec2)

        from_angle : function(number):(LuaVec2)

        __tostring : function(self:LuaVec2):(string)

        __index : function(self:LuaVec2 , integer):(number)

        __newindex : function(self:LuaVec2 , integer , number)

        __div : function(any , any):(any)

        __unm : function(any):(any)

        __mul : function(any , any):(any)

        __mod : function(any , any):(any)

        __sub : function(any , any):(any)

        __add : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaVec2

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number):(LuaVec2)

        splat : function(number):(LuaVec2)

        select : function(LuaBVec2 , LuaVec2 , LuaVec2):(LuaVec2)

        from_array : function({number}):(LuaVec2)

        from_angle : function(number):(LuaVec2)

        __div : function(any , any):(any)

        __unm : function(any):(any)

        __mul : function(any , any):(any)

        __mod : function(any , any):(any)

        __sub : function(any , any):(any)

        __add : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record LuaVec3A

        userdata
    
    --

        to_array : function(self:LuaVec3A):({number})

        extend : function(self:LuaVec3A , number):(LuaVec4)

        truncate : function(self:LuaVec3A):(LuaVec2)

        with_x : function(self:LuaVec3A , number):(LuaVec3A)

        with_y : function(self:LuaVec3A , number):(LuaVec3A)

        with_z : function(self:LuaVec3A , number):(LuaVec3A)

        dot : function(self:LuaVec3A , LuaVec3A):(number)

        dot_into_vec : function(self:LuaVec3A , LuaVec3A):(LuaVec3A)

        cross : function(self:LuaVec3A , LuaVec3A):(LuaVec3A)

        min : function(self:LuaVec3A , LuaVec3A):(LuaVec3A)

        max : function(self:LuaVec3A , LuaVec3A):(LuaVec3A)

        clamp : function(self:LuaVec3A , LuaVec3A , LuaVec3A):(LuaVec3A)

        min_element : function(self:LuaVec3A):(number)

        max_element : function(self:LuaVec3A):(number)

        element_sum : function(self:LuaVec3A):(number)

        element_product : function(self:LuaVec3A):(number)

        cmpeq : function(self:LuaVec3A , LuaVec3A):(LuaBVec3A)

        cmpne : function(self:LuaVec3A , LuaVec3A):(LuaBVec3A)

        cmpge : function(self:LuaVec3A , LuaVec3A):(LuaBVec3A)

        cmpgt : function(self:LuaVec3A , LuaVec3A):(LuaBVec3A)

        cmple : function(self:LuaVec3A , LuaVec3A):(LuaBVec3A)

        cmplt : function(self:LuaVec3A , LuaVec3A):(LuaBVec3A)

        abs : function(self:LuaVec3A):(LuaVec3A)

        signum : function(self:LuaVec3A):(LuaVec3A)

        copysign : function(self:LuaVec3A , LuaVec3A):(LuaVec3A)

        is_negative_bitmask : function(self:LuaVec3A):(integer)

        is_finite : function(self:LuaVec3A):(boolean)

        is_nan : function(self:LuaVec3A):(boolean)

        is_nan_mask : function(self:LuaVec3A):(LuaBVec3A)

        length : function(self:LuaVec3A):(number)

        length_squared : function(self:LuaVec3A):(number)

        length_recip : function(self:LuaVec3A):(number)

        distance : function(self:LuaVec3A , LuaVec3A):(number)

        distance_squared : function(self:LuaVec3A , LuaVec3A):(number)

        div_euclid : function(self:LuaVec3A , LuaVec3A):(LuaVec3A)

        rem_euclid : function(self:LuaVec3A , LuaVec3A):(LuaVec3A)

        normalize : function(self:LuaVec3A):(LuaVec3A)

        normalize_or : function(self:LuaVec3A , LuaVec3A):(LuaVec3A)

        normalize_or_zero : function(self:LuaVec3A):(LuaVec3A)

        is_normalized : function(self:LuaVec3A):(boolean)

        project_onto : function(self:LuaVec3A , LuaVec3A):(LuaVec3A)

        reject_from : function(self:LuaVec3A , LuaVec3A):(LuaVec3A)

        project_onto_normalized : function(self:LuaVec3A , LuaVec3A):(LuaVec3A)

        reject_from_normalized : function(self:LuaVec3A , LuaVec3A):(LuaVec3A)

        round : function(self:LuaVec3A):(LuaVec3A)

        floor : function(self:LuaVec3A):(LuaVec3A)

        ceil : function(self:LuaVec3A):(LuaVec3A)

        trunc : function(self:LuaVec3A):(LuaVec3A)

        fract : function(self:LuaVec3A):(LuaVec3A)

        fract_gl : function(self:LuaVec3A):(LuaVec3A)

        exp : function(self:LuaVec3A):(LuaVec3A)

        powf : function(self:LuaVec3A , number):(LuaVec3A)

        recip : function(self:LuaVec3A):(LuaVec3A)

        lerp : function(self:LuaVec3A , LuaVec3A , number):(LuaVec3A)

        move_towards : function(self:LuaVec3A , LuaVec3A , number):(LuaVec3A)

        midpoint : function(self:LuaVec3A , LuaVec3A):(LuaVec3A)

        abs_diff_eq : function(self:LuaVec3A , LuaVec3A , number):(boolean)

        clamp_length : function(self:LuaVec3A , number , number):(LuaVec3A)

        clamp_length_max : function(self:LuaVec3A , number):(LuaVec3A)

        clamp_length_min : function(self:LuaVec3A , number):(LuaVec3A)

        mul_add : function(self:LuaVec3A , LuaVec3A , LuaVec3A):(LuaVec3A)

        angle_between : function(self:LuaVec3A , LuaVec3A):(number)

        any_orthogonal_vector : function(self:LuaVec3A):(LuaVec3A)

        any_orthonormal_vector : function(self:LuaVec3A):(LuaVec3A)

        as_dvec3 : function(self:LuaVec3A):(LuaDVec3)

        as_ivec3 : function(self:LuaVec3A):(LuaIVec3)

        as_uvec3 : function(self:LuaVec3A):(LuaUVec3)

        as_i64vec3 : function(self:LuaVec3A):(LuaI64Vec3)

        as_u64vec3 : function(self:LuaVec3A):(LuaU64Vec3)

        clone : function(self:LuaVec3A):(LuaVec3A)

        new : function(number , number , number):(LuaVec3A)

        splat : function(number):(LuaVec3A)

        select : function(LuaBVec3A , LuaVec3A , LuaVec3A):(LuaVec3A)

        from_array : function({number}):(LuaVec3A)

        __tostring : function(self:LuaVec3A):(string)

        __index : function(self:LuaVec3A , integer):(number)

        __newindex : function(self:LuaVec3A , integer , number)

        __div : function(any , any):(any)

        __mod : function(any , any):(any)

        __unm : function(any):(any)

        __sub : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaVec3A

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number , number):(LuaVec3A)

        splat : function(number):(LuaVec3A)

        select : function(LuaBVec3A , LuaVec3A , LuaVec3A):(LuaVec3A)

        from_array : function({number}):(LuaVec3A)

        __div : function(any , any):(any)

        __mod : function(any , any):(any)

        __unm : function(any):(any)

        __sub : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record LuaVec4

        userdata
    
    --

        to_array : function(self:LuaVec4):({number})

        truncate : function(self:LuaVec4):(LuaVec3)

        with_x : function(self:LuaVec4 , number):(LuaVec4)

        with_y : function(self:LuaVec4 , number):(LuaVec4)

        with_z : function(self:LuaVec4 , number):(LuaVec4)

        with_w : function(self:LuaVec4 , number):(LuaVec4)

        dot : function(self:LuaVec4 , LuaVec4):(number)

        dot_into_vec : function(self:LuaVec4 , LuaVec4):(LuaVec4)

        min : function(self:LuaVec4 , LuaVec4):(LuaVec4)

        max : function(self:LuaVec4 , LuaVec4):(LuaVec4)

        clamp : function(self:LuaVec4 , LuaVec4 , LuaVec4):(LuaVec4)

        min_element : function(self:LuaVec4):(number)

        max_element : function(self:LuaVec4):(number)

        element_sum : function(self:LuaVec4):(number)

        element_product : function(self:LuaVec4):(number)

        cmpeq : function(self:LuaVec4 , LuaVec4):(LuaBVec4A)

        cmpne : function(self:LuaVec4 , LuaVec4):(LuaBVec4A)

        cmpge : function(self:LuaVec4 , LuaVec4):(LuaBVec4A)

        cmpgt : function(self:LuaVec4 , LuaVec4):(LuaBVec4A)

        cmple : function(self:LuaVec4 , LuaVec4):(LuaBVec4A)

        cmplt : function(self:LuaVec4 , LuaVec4):(LuaBVec4A)

        abs : function(self:LuaVec4):(LuaVec4)

        signum : function(self:LuaVec4):(LuaVec4)

        copysign : function(self:LuaVec4 , LuaVec4):(LuaVec4)

        is_negative_bitmask : function(self:LuaVec4):(integer)

        is_finite : function(self:LuaVec4):(boolean)

        is_nan : function(self:LuaVec4):(boolean)

        is_nan_mask : function(self:LuaVec4):(LuaBVec4A)

        length : function(self:LuaVec4):(number)

        length_squared : function(self:LuaVec4):(number)

        length_recip : function(self:LuaVec4):(number)

        distance : function(self:LuaVec4 , LuaVec4):(number)

        distance_squared : function(self:LuaVec4 , LuaVec4):(number)

        div_euclid : function(self:LuaVec4 , LuaVec4):(LuaVec4)

        rem_euclid : function(self:LuaVec4 , LuaVec4):(LuaVec4)

        normalize : function(self:LuaVec4):(LuaVec4)

        normalize_or : function(self:LuaVec4 , LuaVec4):(LuaVec4)

        normalize_or_zero : function(self:LuaVec4):(LuaVec4)

        is_normalized : function(self:LuaVec4):(boolean)

        project_onto : function(self:LuaVec4 , LuaVec4):(LuaVec4)

        reject_from : function(self:LuaVec4 , LuaVec4):(LuaVec4)

        project_onto_normalized : function(self:LuaVec4 , LuaVec4):(LuaVec4)

        reject_from_normalized : function(self:LuaVec4 , LuaVec4):(LuaVec4)

        round : function(self:LuaVec4):(LuaVec4)

        floor : function(self:LuaVec4):(LuaVec4)

        ceil : function(self:LuaVec4):(LuaVec4)

        trunc : function(self:LuaVec4):(LuaVec4)

        fract : function(self:LuaVec4):(LuaVec4)

        fract_gl : function(self:LuaVec4):(LuaVec4)

        exp : function(self:LuaVec4):(LuaVec4)

        powf : function(self:LuaVec4 , number):(LuaVec4)

        recip : function(self:LuaVec4):(LuaVec4)

        lerp : function(self:LuaVec4 , LuaVec4 , number):(LuaVec4)

        move_towards : function(self:LuaVec4 , LuaVec4 , number):(LuaVec4)

        midpoint : function(self:LuaVec4 , LuaVec4):(LuaVec4)

        abs_diff_eq : function(self:LuaVec4 , LuaVec4 , number):(boolean)

        clamp_length : function(self:LuaVec4 , number , number):(LuaVec4)

        clamp_length_max : function(self:LuaVec4 , number):(LuaVec4)

        clamp_length_min : function(self:LuaVec4 , number):(LuaVec4)

        mul_add : function(self:LuaVec4 , LuaVec4 , LuaVec4):(LuaVec4)

        as_dvec4 : function(self:LuaVec4):(LuaDVec4)

        as_ivec4 : function(self:LuaVec4):(LuaIVec4)

        as_uvec4 : function(self:LuaVec4):(LuaUVec4)

        as_i64vec4 : function(self:LuaVec4):(LuaI64Vec4)

        as_u64vec4 : function(self:LuaVec4):(LuaU64Vec4)

        clone : function(self:LuaVec4):(LuaVec4)

        new : function(number , number , number , number):(LuaVec4)

        splat : function(number):(LuaVec4)

        select : function(LuaBVec4A , LuaVec4 , LuaVec4):(LuaVec4)

        from_array : function({number}):(LuaVec4)

        __tostring : function(self:LuaVec4):(string)

        __index : function(self:LuaVec4 , integer):(number)

        __newindex : function(self:LuaVec4 , integer , number)

        __add : function(any , any):(any)

        __mul : function(any , any):(any)

        __unm : function(any):(any)

        __mod : function(any , any):(any)

        __eq : function(any , any):(any)

        __div : function(any , any):(any)

        __sub : function(any , any):(any)

    end
    
    
    record ClassLuaVec4

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number , number , number):(LuaVec4)

        splat : function(number):(LuaVec4)

        select : function(LuaBVec4A , LuaVec4 , LuaVec4):(LuaVec4)

        from_array : function({number}):(LuaVec4)

        __add : function(any , any):(any)

        __mul : function(any , any):(any)

        __unm : function(any):(any)

        __mod : function(any , any):(any)

        __eq : function(any , any):(any)

        __div : function(any , any):(any)

        __sub : function(any , any):(any)

    end
    
    
    record LuaBVec2

        userdata
    
    --

        x : boolean

        y : boolean

        x : boolean

        y : boolean

        clone : function(self:LuaBVec2):(LuaBVec2)

        assert_receiver_is_total_eq : function(self:LuaBVec2)

        bitmask : function(self:LuaBVec2):(integer)

        any : function(self:LuaBVec2):(boolean)

        all : function(self:LuaBVec2):(boolean)

        test : function(self:LuaBVec2 , integer):(boolean)

        set : function(self:LuaBVec2 , integer , boolean)

        new : function(boolean , boolean):(LuaBVec2)

        splat : function(boolean):(LuaBVec2)

        from_array : function({boolean}):(LuaBVec2)

        __tostring : function(self:LuaBVec2):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaBVec2

        userdata
    
    --Collection of static methods for [``].

        new : function(boolean , boolean):(LuaBVec2)

        splat : function(boolean):(LuaBVec2)

        from_array : function({boolean}):(LuaBVec2)

        __eq : function(any , any):(any)

    end
    
    
    record LuaBVec3

        userdata
    
    --

        x : boolean

        y : boolean

        z : boolean

        x : boolean

        y : boolean

        z : boolean

        clone : function(self:LuaBVec3):(LuaBVec3)

        bitmask : function(self:LuaBVec3):(integer)

        any : function(self:LuaBVec3):(boolean)

        all : function(self:LuaBVec3):(boolean)

        test : function(self:LuaBVec3 , integer):(boolean)

        assert_receiver_is_total_eq : function(self:LuaBVec3)

        set : function(self:LuaBVec3 , integer , boolean)

        new : function(boolean , boolean , boolean):(LuaBVec3)

        splat : function(boolean):(LuaBVec3)

        from_array : function({boolean}):(LuaBVec3)

        __tostring : function(self:LuaBVec3):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaBVec3

        userdata
    
    --Collection of static methods for [``].

        new : function(boolean , boolean , boolean):(LuaBVec3)

        splat : function(boolean):(LuaBVec3)

        from_array : function({boolean}):(LuaBVec3)

        __eq : function(any , any):(any)

    end
    
    
    record LuaBVec4

        userdata
    
    --

        x : boolean

        y : boolean

        z : boolean

        w : boolean

        x : boolean

        y : boolean

        z : boolean

        w : boolean

        clone : function(self:LuaBVec4):(LuaBVec4)

        bitmask : function(self:LuaBVec4):(integer)

        any : function(self:LuaBVec4):(boolean)

        all : function(self:LuaBVec4):(boolean)

        test : function(self:LuaBVec4 , integer):(boolean)

        assert_receiver_is_total_eq : function(self:LuaBVec4)

        set : function(self:LuaBVec4 , integer , boolean)

        new : function(boolean , boolean , boolean , boolean):(LuaBVec4)

        splat : function(boolean):(LuaBVec4)

        from_array : function({boolean}):(LuaBVec4)

        __tostring : function(self:LuaBVec4):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaBVec4

        userdata
    
    --Collection of static methods for [``].

        new : function(boolean , boolean , boolean , boolean):(LuaBVec4)

        splat : function(boolean):(LuaBVec4)

        from_array : function({boolean}):(LuaBVec4)

        __eq : function(any , any):(any)

    end
    
    
    record LuaDVec2

        userdata
    
    --

        x : number

        y : number

        x : number

        y : number

        clone : function(self:LuaDVec2):(LuaDVec2)

        to_array : function(self:LuaDVec2):({number})

        extend : function(self:LuaDVec2 , number):(LuaDVec3)

        with_x : function(self:LuaDVec2 , number):(LuaDVec2)

        with_y : function(self:LuaDVec2 , number):(LuaDVec2)

        dot : function(self:LuaDVec2 , LuaDVec2):(number)

        dot_into_vec : function(self:LuaDVec2 , LuaDVec2):(LuaDVec2)

        min : function(self:LuaDVec2 , LuaDVec2):(LuaDVec2)

        max : function(self:LuaDVec2 , LuaDVec2):(LuaDVec2)

        clamp : function(self:LuaDVec2 , LuaDVec2 , LuaDVec2):(LuaDVec2)

        min_element : function(self:LuaDVec2):(number)

        max_element : function(self:LuaDVec2):(number)

        element_sum : function(self:LuaDVec2):(number)

        element_product : function(self:LuaDVec2):(number)

        cmpeq : function(self:LuaDVec2 , LuaDVec2):(LuaBVec2)

        cmpne : function(self:LuaDVec2 , LuaDVec2):(LuaBVec2)

        cmpge : function(self:LuaDVec2 , LuaDVec2):(LuaBVec2)

        cmpgt : function(self:LuaDVec2 , LuaDVec2):(LuaBVec2)

        cmple : function(self:LuaDVec2 , LuaDVec2):(LuaBVec2)

        cmplt : function(self:LuaDVec2 , LuaDVec2):(LuaBVec2)

        abs : function(self:LuaDVec2):(LuaDVec2)

        signum : function(self:LuaDVec2):(LuaDVec2)

        copysign : function(self:LuaDVec2 , LuaDVec2):(LuaDVec2)

        is_negative_bitmask : function(self:LuaDVec2):(integer)

        is_finite : function(self:LuaDVec2):(boolean)

        is_nan : function(self:LuaDVec2):(boolean)

        is_nan_mask : function(self:LuaDVec2):(LuaBVec2)

        length : function(self:LuaDVec2):(number)

        length_squared : function(self:LuaDVec2):(number)

        length_recip : function(self:LuaDVec2):(number)

        distance : function(self:LuaDVec2 , LuaDVec2):(number)

        distance_squared : function(self:LuaDVec2 , LuaDVec2):(number)

        div_euclid : function(self:LuaDVec2 , LuaDVec2):(LuaDVec2)

        rem_euclid : function(self:LuaDVec2 , LuaDVec2):(LuaDVec2)

        normalize : function(self:LuaDVec2):(LuaDVec2)

        normalize_or : function(self:LuaDVec2 , LuaDVec2):(LuaDVec2)

        normalize_or_zero : function(self:LuaDVec2):(LuaDVec2)

        is_normalized : function(self:LuaDVec2):(boolean)

        project_onto : function(self:LuaDVec2 , LuaDVec2):(LuaDVec2)

        reject_from : function(self:LuaDVec2 , LuaDVec2):(LuaDVec2)

        project_onto_normalized : function(self:LuaDVec2 , LuaDVec2):(LuaDVec2)

        reject_from_normalized : function(self:LuaDVec2 , LuaDVec2):(LuaDVec2)

        round : function(self:LuaDVec2):(LuaDVec2)

        floor : function(self:LuaDVec2):(LuaDVec2)

        ceil : function(self:LuaDVec2):(LuaDVec2)

        trunc : function(self:LuaDVec2):(LuaDVec2)

        fract : function(self:LuaDVec2):(LuaDVec2)

        fract_gl : function(self:LuaDVec2):(LuaDVec2)

        exp : function(self:LuaDVec2):(LuaDVec2)

        powf : function(self:LuaDVec2 , number):(LuaDVec2)

        recip : function(self:LuaDVec2):(LuaDVec2)

        lerp : function(self:LuaDVec2 , LuaDVec2 , number):(LuaDVec2)

        move_towards : function(self:LuaDVec2 , LuaDVec2 , number):(LuaDVec2)

        midpoint : function(self:LuaDVec2 , LuaDVec2):(LuaDVec2)

        abs_diff_eq : function(self:LuaDVec2 , LuaDVec2 , number):(boolean)

        clamp_length : function(self:LuaDVec2 , number , number):(LuaDVec2)

        clamp_length_max : function(self:LuaDVec2 , number):(LuaDVec2)

        clamp_length_min : function(self:LuaDVec2 , number):(LuaDVec2)

        mul_add : function(self:LuaDVec2 , LuaDVec2 , LuaDVec2):(LuaDVec2)

        to_angle : function(self:LuaDVec2):(number)

        angle_between : function(self:LuaDVec2 , LuaDVec2):(number)

        perp : function(self:LuaDVec2):(LuaDVec2)

        perp_dot : function(self:LuaDVec2 , LuaDVec2):(number)

        rotate : function(self:LuaDVec2 , LuaDVec2):(LuaDVec2)

        as_vec2 : function(self:LuaDVec2):(LuaVec2)

        as_ivec2 : function(self:LuaDVec2):(LuaIVec2)

        as_uvec2 : function(self:LuaDVec2):(LuaUVec2)

        as_i64vec2 : function(self:LuaDVec2):(LuaI64Vec2)

        as_u64vec2 : function(self:LuaDVec2):(LuaU64Vec2)

        new : function(number , number):(LuaDVec2)

        splat : function(number):(LuaDVec2)

        select : function(LuaBVec2 , LuaDVec2 , LuaDVec2):(LuaDVec2)

        from_array : function({number}):(LuaDVec2)

        from_angle : function(number):(LuaDVec2)

        __tostring : function(self:LuaDVec2):(string)

        __index : function(self:LuaDVec2 , integer):(number)

        __newindex : function(self:LuaDVec2 , integer , number)

        __div : function(any , any):(any)

        __unm : function(any):(any)

        __add : function(any , any):(any)

        __mul : function(any , any):(any)

        __eq : function(any , any):(any)

        __sub : function(any , any):(any)

        __mod : function(any , any):(any)

    end
    
    
    record ClassLuaDVec2

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number):(LuaDVec2)

        splat : function(number):(LuaDVec2)

        select : function(LuaBVec2 , LuaDVec2 , LuaDVec2):(LuaDVec2)

        from_array : function({number}):(LuaDVec2)

        from_angle : function(number):(LuaDVec2)

        __div : function(any , any):(any)

        __unm : function(any):(any)

        __add : function(any , any):(any)

        __mul : function(any , any):(any)

        __eq : function(any , any):(any)

        __sub : function(any , any):(any)

        __mod : function(any , any):(any)

    end
    
    
    record LuaDVec3

        userdata
    
    --

        x : number

        y : number

        z : number

        x : number

        y : number

        z : number

        clone : function(self:LuaDVec3):(LuaDVec3)

        to_array : function(self:LuaDVec3):({number})

        extend : function(self:LuaDVec3 , number):(LuaDVec4)

        truncate : function(self:LuaDVec3):(LuaDVec2)

        with_x : function(self:LuaDVec3 , number):(LuaDVec3)

        with_y : function(self:LuaDVec3 , number):(LuaDVec3)

        with_z : function(self:LuaDVec3 , number):(LuaDVec3)

        dot : function(self:LuaDVec3 , LuaDVec3):(number)

        dot_into_vec : function(self:LuaDVec3 , LuaDVec3):(LuaDVec3)

        cross : function(self:LuaDVec3 , LuaDVec3):(LuaDVec3)

        min : function(self:LuaDVec3 , LuaDVec3):(LuaDVec3)

        max : function(self:LuaDVec3 , LuaDVec3):(LuaDVec3)

        clamp : function(self:LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDVec3)

        min_element : function(self:LuaDVec3):(number)

        max_element : function(self:LuaDVec3):(number)

        element_sum : function(self:LuaDVec3):(number)

        element_product : function(self:LuaDVec3):(number)

        cmpeq : function(self:LuaDVec3 , LuaDVec3):(LuaBVec3)

        cmpne : function(self:LuaDVec3 , LuaDVec3):(LuaBVec3)

        cmpge : function(self:LuaDVec3 , LuaDVec3):(LuaBVec3)

        cmpgt : function(self:LuaDVec3 , LuaDVec3):(LuaBVec3)

        cmple : function(self:LuaDVec3 , LuaDVec3):(LuaBVec3)

        cmplt : function(self:LuaDVec3 , LuaDVec3):(LuaBVec3)

        abs : function(self:LuaDVec3):(LuaDVec3)

        signum : function(self:LuaDVec3):(LuaDVec3)

        copysign : function(self:LuaDVec3 , LuaDVec3):(LuaDVec3)

        is_negative_bitmask : function(self:LuaDVec3):(integer)

        is_finite : function(self:LuaDVec3):(boolean)

        is_nan : function(self:LuaDVec3):(boolean)

        is_nan_mask : function(self:LuaDVec3):(LuaBVec3)

        length : function(self:LuaDVec3):(number)

        length_squared : function(self:LuaDVec3):(number)

        length_recip : function(self:LuaDVec3):(number)

        distance : function(self:LuaDVec3 , LuaDVec3):(number)

        distance_squared : function(self:LuaDVec3 , LuaDVec3):(number)

        div_euclid : function(self:LuaDVec3 , LuaDVec3):(LuaDVec3)

        rem_euclid : function(self:LuaDVec3 , LuaDVec3):(LuaDVec3)

        normalize : function(self:LuaDVec3):(LuaDVec3)

        normalize_or : function(self:LuaDVec3 , LuaDVec3):(LuaDVec3)

        normalize_or_zero : function(self:LuaDVec3):(LuaDVec3)

        is_normalized : function(self:LuaDVec3):(boolean)

        project_onto : function(self:LuaDVec3 , LuaDVec3):(LuaDVec3)

        reject_from : function(self:LuaDVec3 , LuaDVec3):(LuaDVec3)

        project_onto_normalized : function(self:LuaDVec3 , LuaDVec3):(LuaDVec3)

        reject_from_normalized : function(self:LuaDVec3 , LuaDVec3):(LuaDVec3)

        round : function(self:LuaDVec3):(LuaDVec3)

        floor : function(self:LuaDVec3):(LuaDVec3)

        ceil : function(self:LuaDVec3):(LuaDVec3)

        trunc : function(self:LuaDVec3):(LuaDVec3)

        fract : function(self:LuaDVec3):(LuaDVec3)

        fract_gl : function(self:LuaDVec3):(LuaDVec3)

        exp : function(self:LuaDVec3):(LuaDVec3)

        powf : function(self:LuaDVec3 , number):(LuaDVec3)

        recip : function(self:LuaDVec3):(LuaDVec3)

        lerp : function(self:LuaDVec3 , LuaDVec3 , number):(LuaDVec3)

        move_towards : function(self:LuaDVec3 , LuaDVec3 , number):(LuaDVec3)

        midpoint : function(self:LuaDVec3 , LuaDVec3):(LuaDVec3)

        abs_diff_eq : function(self:LuaDVec3 , LuaDVec3 , number):(boolean)

        clamp_length : function(self:LuaDVec3 , number , number):(LuaDVec3)

        clamp_length_max : function(self:LuaDVec3 , number):(LuaDVec3)

        clamp_length_min : function(self:LuaDVec3 , number):(LuaDVec3)

        mul_add : function(self:LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDVec3)

        angle_between : function(self:LuaDVec3 , LuaDVec3):(number)

        any_orthogonal_vector : function(self:LuaDVec3):(LuaDVec3)

        any_orthonormal_vector : function(self:LuaDVec3):(LuaDVec3)

        as_vec3 : function(self:LuaDVec3):(LuaVec3)

        as_vec3a : function(self:LuaDVec3):(LuaVec3A)

        as_ivec3 : function(self:LuaDVec3):(LuaIVec3)

        as_uvec3 : function(self:LuaDVec3):(LuaUVec3)

        as_i64vec3 : function(self:LuaDVec3):(LuaI64Vec3)

        as_u64vec3 : function(self:LuaDVec3):(LuaU64Vec3)

        new : function(number , number , number):(LuaDVec3)

        splat : function(number):(LuaDVec3)

        select : function(LuaBVec3 , LuaDVec3 , LuaDVec3):(LuaDVec3)

        from_array : function({number}):(LuaDVec3)

        __tostring : function(self:LuaDVec3):(string)

        __index : function(self:LuaDVec3 , integer):(number)

        __newindex : function(self:LuaDVec3 , integer , number)

        __mod : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __div : function(any , any):(any)

        __eq : function(any , any):(any)

        __unm : function(any):(any)

        __sub : function(any , any):(any)

    end
    
    
    record ClassLuaDVec3

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number , number):(LuaDVec3)

        splat : function(number):(LuaDVec3)

        select : function(LuaBVec3 , LuaDVec3 , LuaDVec3):(LuaDVec3)

        from_array : function({number}):(LuaDVec3)

        __mod : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __div : function(any , any):(any)

        __eq : function(any , any):(any)

        __unm : function(any):(any)

        __sub : function(any , any):(any)

    end
    
    
    record LuaDVec4

        userdata
    
    --

        x : number

        y : number

        z : number

        w : number

        x : number

        y : number

        z : number

        w : number

        clone : function(self:LuaDVec4):(LuaDVec4)

        to_array : function(self:LuaDVec4):({number})

        truncate : function(self:LuaDVec4):(LuaDVec3)

        with_x : function(self:LuaDVec4 , number):(LuaDVec4)

        with_y : function(self:LuaDVec4 , number):(LuaDVec4)

        with_z : function(self:LuaDVec4 , number):(LuaDVec4)

        with_w : function(self:LuaDVec4 , number):(LuaDVec4)

        dot : function(self:LuaDVec4 , LuaDVec4):(number)

        dot_into_vec : function(self:LuaDVec4 , LuaDVec4):(LuaDVec4)

        min : function(self:LuaDVec4 , LuaDVec4):(LuaDVec4)

        max : function(self:LuaDVec4 , LuaDVec4):(LuaDVec4)

        clamp : function(self:LuaDVec4 , LuaDVec4 , LuaDVec4):(LuaDVec4)

        min_element : function(self:LuaDVec4):(number)

        max_element : function(self:LuaDVec4):(number)

        element_sum : function(self:LuaDVec4):(number)

        element_product : function(self:LuaDVec4):(number)

        cmpeq : function(self:LuaDVec4 , LuaDVec4):(LuaBVec4)

        cmpne : function(self:LuaDVec4 , LuaDVec4):(LuaBVec4)

        cmpge : function(self:LuaDVec4 , LuaDVec4):(LuaBVec4)

        cmpgt : function(self:LuaDVec4 , LuaDVec4):(LuaBVec4)

        cmple : function(self:LuaDVec4 , LuaDVec4):(LuaBVec4)

        cmplt : function(self:LuaDVec4 , LuaDVec4):(LuaBVec4)

        abs : function(self:LuaDVec4):(LuaDVec4)

        signum : function(self:LuaDVec4):(LuaDVec4)

        copysign : function(self:LuaDVec4 , LuaDVec4):(LuaDVec4)

        is_negative_bitmask : function(self:LuaDVec4):(integer)

        is_finite : function(self:LuaDVec4):(boolean)

        is_nan : function(self:LuaDVec4):(boolean)

        is_nan_mask : function(self:LuaDVec4):(LuaBVec4)

        length : function(self:LuaDVec4):(number)

        length_squared : function(self:LuaDVec4):(number)

        length_recip : function(self:LuaDVec4):(number)

        distance : function(self:LuaDVec4 , LuaDVec4):(number)

        distance_squared : function(self:LuaDVec4 , LuaDVec4):(number)

        div_euclid : function(self:LuaDVec4 , LuaDVec4):(LuaDVec4)

        rem_euclid : function(self:LuaDVec4 , LuaDVec4):(LuaDVec4)

        normalize : function(self:LuaDVec4):(LuaDVec4)

        normalize_or : function(self:LuaDVec4 , LuaDVec4):(LuaDVec4)

        normalize_or_zero : function(self:LuaDVec4):(LuaDVec4)

        is_normalized : function(self:LuaDVec4):(boolean)

        project_onto : function(self:LuaDVec4 , LuaDVec4):(LuaDVec4)

        reject_from : function(self:LuaDVec4 , LuaDVec4):(LuaDVec4)

        project_onto_normalized : function(self:LuaDVec4 , LuaDVec4):(LuaDVec4)

        reject_from_normalized : function(self:LuaDVec4 , LuaDVec4):(LuaDVec4)

        round : function(self:LuaDVec4):(LuaDVec4)

        floor : function(self:LuaDVec4):(LuaDVec4)

        ceil : function(self:LuaDVec4):(LuaDVec4)

        trunc : function(self:LuaDVec4):(LuaDVec4)

        fract : function(self:LuaDVec4):(LuaDVec4)

        fract_gl : function(self:LuaDVec4):(LuaDVec4)

        exp : function(self:LuaDVec4):(LuaDVec4)

        powf : function(self:LuaDVec4 , number):(LuaDVec4)

        recip : function(self:LuaDVec4):(LuaDVec4)

        lerp : function(self:LuaDVec4 , LuaDVec4 , number):(LuaDVec4)

        move_towards : function(self:LuaDVec4 , LuaDVec4 , number):(LuaDVec4)

        midpoint : function(self:LuaDVec4 , LuaDVec4):(LuaDVec4)

        abs_diff_eq : function(self:LuaDVec4 , LuaDVec4 , number):(boolean)

        clamp_length : function(self:LuaDVec4 , number , number):(LuaDVec4)

        clamp_length_max : function(self:LuaDVec4 , number):(LuaDVec4)

        clamp_length_min : function(self:LuaDVec4 , number):(LuaDVec4)

        mul_add : function(self:LuaDVec4 , LuaDVec4 , LuaDVec4):(LuaDVec4)

        as_vec4 : function(self:LuaDVec4):(LuaVec4)

        as_ivec4 : function(self:LuaDVec4):(LuaIVec4)

        as_uvec4 : function(self:LuaDVec4):(LuaUVec4)

        as_i64vec4 : function(self:LuaDVec4):(LuaI64Vec4)

        as_u64vec4 : function(self:LuaDVec4):(LuaU64Vec4)

        new : function(number , number , number , number):(LuaDVec4)

        splat : function(number):(LuaDVec4)

        select : function(LuaBVec4 , LuaDVec4 , LuaDVec4):(LuaDVec4)

        from_array : function({number}):(LuaDVec4)

        __tostring : function(self:LuaDVec4):(string)

        __index : function(self:LuaDVec4 , integer):(number)

        __newindex : function(self:LuaDVec4 , integer , number)

        __mul : function(any , any):(any)

        __eq : function(any , any):(any)

        __add : function(any , any):(any)

        __div : function(any , any):(any)

        __sub : function(any , any):(any)

        __unm : function(any):(any)

        __mod : function(any , any):(any)

    end
    
    
    record ClassLuaDVec4

        userdata
    
    --Collection of static methods for [``].

        new : function(number , number , number , number):(LuaDVec4)

        splat : function(number):(LuaDVec4)

        select : function(LuaBVec4 , LuaDVec4 , LuaDVec4):(LuaDVec4)

        from_array : function({number}):(LuaDVec4)

        __mul : function(any , any):(any)

        __eq : function(any , any):(any)

        __add : function(any , any):(any)

        __div : function(any , any):(any)

        __sub : function(any , any):(any)

        __unm : function(any):(any)

        __mod : function(any , any):(any)

    end
    
    
    record LuaMat2

        userdata
    
    --

        clone : function(self:LuaMat2):(LuaMat2)

        to_cols_array : function(self:LuaMat2):({number})

        to_cols_array_2d : function(self:LuaMat2):({{number}})

        col : function(self:LuaMat2 , integer):(LuaVec2)

        row : function(self:LuaMat2 , integer):(LuaVec2)

        is_finite : function(self:LuaMat2):(boolean)

        is_nan : function(self:LuaMat2):(boolean)

        transpose : function(self:LuaMat2):(LuaMat2)

        determinant : function(self:LuaMat2):(number)

        inverse : function(self:LuaMat2):(LuaMat2)

        mul_vec2 : function(self:LuaMat2 , LuaVec2):(LuaVec2)

        mul_mat2 : function(self:LuaMat2 , LuaMat2):(LuaMat2)

        add_mat2 : function(self:LuaMat2 , LuaMat2):(LuaMat2)

        sub_mat2 : function(self:LuaMat2 , LuaMat2):(LuaMat2)

        mul_scalar : function(self:LuaMat2 , number):(LuaMat2)

        div_scalar : function(self:LuaMat2 , number):(LuaMat2)

        abs_diff_eq : function(self:LuaMat2 , LuaMat2 , number):(boolean)

        abs : function(self:LuaMat2):(LuaMat2)

        as_dmat2 : function(self:LuaMat2):(LuaDMat2)

        from_cols : function(LuaVec2 , LuaVec2):(LuaMat2)

        from_diagonal : function(LuaVec2):(LuaMat2)

        from_scale_angle : function(LuaVec2 , number):(LuaMat2)

        from_angle : function(number):(LuaMat2)

        from_mat3 : function(LuaMat3):(LuaMat2)

        from_mat3a : function(LuaMat3A):(LuaMat2)

        __tostring : function(self:LuaMat2):(string)

        __index : function(self:LuaMat2 , integer):(LuaVec2)

        __mul : function(any , any):(any)

        __div : function(any , any):(any)

        __sub : function(any , any):(any)

        __unm : function(any):(any)

        __add : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaMat2

        userdata
    
    --Collection of static methods for [``].

        from_cols : function(LuaVec2 , LuaVec2):(LuaMat2)

        from_diagonal : function(LuaVec2):(LuaMat2)

        from_scale_angle : function(LuaVec2 , number):(LuaMat2)

        from_angle : function(number):(LuaMat2)

        from_mat3 : function(LuaMat3):(LuaMat2)

        from_mat3a : function(LuaMat3A):(LuaMat2)

        __mul : function(any , any):(any)

        __div : function(any , any):(any)

        __sub : function(any , any):(any)

        __unm : function(any):(any)

        __add : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record LuaMat3

        userdata
    
    --

        x_axis : LuaVec3

        y_axis : LuaVec3

        z_axis : LuaVec3

        x_axis : LuaVec3

        y_axis : LuaVec3

        z_axis : LuaVec3

        to_cols_array : function(self:LuaMat3):({number})

        to_cols_array_2d : function(self:LuaMat3):({{number}})

        col : function(self:LuaMat3 , integer):(LuaVec3)

        row : function(self:LuaMat3 , integer):(LuaVec3)

        is_finite : function(self:LuaMat3):(boolean)

        is_nan : function(self:LuaMat3):(boolean)

        transpose : function(self:LuaMat3):(LuaMat3)

        determinant : function(self:LuaMat3):(number)

        inverse : function(self:LuaMat3):(LuaMat3)

        transform_point2 : function(self:LuaMat3 , LuaVec2):(LuaVec2)

        transform_vector2 : function(self:LuaMat3 , LuaVec2):(LuaVec2)

        mul_vec3 : function(self:LuaMat3 , LuaVec3):(LuaVec3)

        mul_vec3a : function(self:LuaMat3 , LuaVec3A):(LuaVec3A)

        mul_mat3 : function(self:LuaMat3 , LuaMat3):(LuaMat3)

        add_mat3 : function(self:LuaMat3 , LuaMat3):(LuaMat3)

        sub_mat3 : function(self:LuaMat3 , LuaMat3):(LuaMat3)

        mul_scalar : function(self:LuaMat3 , number):(LuaMat3)

        div_scalar : function(self:LuaMat3 , number):(LuaMat3)

        abs_diff_eq : function(self:LuaMat3 , LuaMat3 , number):(boolean)

        abs : function(self:LuaMat3):(LuaMat3)

        as_dmat3 : function(self:LuaMat3):(LuaDMat3)

        clone : function(self:LuaMat3):(LuaMat3)

        from_cols : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaMat3)

        from_diagonal : function(LuaVec3):(LuaMat3)

        from_mat4 : function(LuaMat4):(LuaMat3)

        from_quat : function(LuaQuat):(LuaMat3)

        from_axis_angle : function(LuaVec3 , number):(LuaMat3)

        from_euler : function(LuaEulerRot , number , number , number):(LuaMat3)

        from_rotation_x : function(number):(LuaMat3)

        from_rotation_y : function(number):(LuaMat3)

        from_rotation_z : function(number):(LuaMat3)

        from_translation : function(LuaVec2):(LuaMat3)

        from_angle : function(number):(LuaMat3)

        from_scale_angle_translation : function(LuaVec2 , number , LuaVec2):(LuaMat3)

        from_scale : function(LuaVec2):(LuaMat3)

        from_mat2 : function(LuaMat2):(LuaMat3)

        __tostring : function(self:LuaMat3):(string)

        __index : function(self:LuaMat3 , integer):(LuaVec3)

        __sub : function(any , any):(any)

        __div : function(any , any):(any)

        __eq : function(any , any):(any)

        __unm : function(any):(any)

        __add : function(any , any):(any)

        __mul : function(any , any):(any)

    end
    
    
    record ClassLuaMat3

        userdata
    
    --Collection of static methods for [``].

        from_cols : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaMat3)

        from_diagonal : function(LuaVec3):(LuaMat3)

        from_mat4 : function(LuaMat4):(LuaMat3)

        from_quat : function(LuaQuat):(LuaMat3)

        from_axis_angle : function(LuaVec3 , number):(LuaMat3)

        from_euler : function(LuaEulerRot , number , number , number):(LuaMat3)

        from_rotation_x : function(number):(LuaMat3)

        from_rotation_y : function(number):(LuaMat3)

        from_rotation_z : function(number):(LuaMat3)

        from_translation : function(LuaVec2):(LuaMat3)

        from_angle : function(number):(LuaMat3)

        from_scale_angle_translation : function(LuaVec2 , number , LuaVec2):(LuaMat3)

        from_scale : function(LuaVec2):(LuaMat3)

        from_mat2 : function(LuaMat2):(LuaMat3)

        __sub : function(any , any):(any)

        __div : function(any , any):(any)

        __eq : function(any , any):(any)

        __unm : function(any):(any)

        __add : function(any , any):(any)

        __mul : function(any , any):(any)

    end
    
    
    record LuaMat3A

        userdata
    
    --

        x_axis : LuaVec3A

        y_axis : LuaVec3A

        z_axis : LuaVec3A

        x_axis : LuaVec3A

        y_axis : LuaVec3A

        z_axis : LuaVec3A

        to_cols_array : function(self:LuaMat3A):({number})

        to_cols_array_2d : function(self:LuaMat3A):({{number}})

        col : function(self:LuaMat3A , integer):(LuaVec3A)

        row : function(self:LuaMat3A , integer):(LuaVec3A)

        is_finite : function(self:LuaMat3A):(boolean)

        is_nan : function(self:LuaMat3A):(boolean)

        transpose : function(self:LuaMat3A):(LuaMat3A)

        determinant : function(self:LuaMat3A):(number)

        inverse : function(self:LuaMat3A):(LuaMat3A)

        transform_point2 : function(self:LuaMat3A , LuaVec2):(LuaVec2)

        transform_vector2 : function(self:LuaMat3A , LuaVec2):(LuaVec2)

        mul_vec3 : function(self:LuaMat3A , LuaVec3):(LuaVec3)

        mul_vec3a : function(self:LuaMat3A , LuaVec3A):(LuaVec3A)

        mul_mat3 : function(self:LuaMat3A , LuaMat3A):(LuaMat3A)

        add_mat3 : function(self:LuaMat3A , LuaMat3A):(LuaMat3A)

        sub_mat3 : function(self:LuaMat3A , LuaMat3A):(LuaMat3A)

        mul_scalar : function(self:LuaMat3A , number):(LuaMat3A)

        div_scalar : function(self:LuaMat3A , number):(LuaMat3A)

        abs_diff_eq : function(self:LuaMat3A , LuaMat3A , number):(boolean)

        abs : function(self:LuaMat3A):(LuaMat3A)

        as_dmat3 : function(self:LuaMat3A):(LuaDMat3)

        clone : function(self:LuaMat3A):(LuaMat3A)

        from_cols : function(LuaVec3A , LuaVec3A , LuaVec3A):(LuaMat3A)

        from_diagonal : function(LuaVec3):(LuaMat3A)

        from_mat4 : function(LuaMat4):(LuaMat3A)

        from_quat : function(LuaQuat):(LuaMat3A)

        from_axis_angle : function(LuaVec3 , number):(LuaMat3A)

        from_euler : function(LuaEulerRot , number , number , number):(LuaMat3A)

        from_rotation_x : function(number):(LuaMat3A)

        from_rotation_y : function(number):(LuaMat3A)

        from_rotation_z : function(number):(LuaMat3A)

        from_translation : function(LuaVec2):(LuaMat3A)

        from_angle : function(number):(LuaMat3A)

        from_scale_angle_translation : function(LuaVec2 , number , LuaVec2):(LuaMat3A)

        from_scale : function(LuaVec2):(LuaMat3A)

        from_mat2 : function(LuaMat2):(LuaMat3A)

        __tostring : function(self:LuaMat3A):(string)

        __index : function(self:LuaMat3A , integer):(LuaVec3A)

        __div : function(any , any):(any)

        __unm : function(any):(any)

        __sub : function(any , any):(any)

        __eq : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

    end
    
    
    record ClassLuaMat3A

        userdata
    
    --Collection of static methods for [``].

        from_cols : function(LuaVec3A , LuaVec3A , LuaVec3A):(LuaMat3A)

        from_diagonal : function(LuaVec3):(LuaMat3A)

        from_mat4 : function(LuaMat4):(LuaMat3A)

        from_quat : function(LuaQuat):(LuaMat3A)

        from_axis_angle : function(LuaVec3 , number):(LuaMat3A)

        from_euler : function(LuaEulerRot , number , number , number):(LuaMat3A)

        from_rotation_x : function(number):(LuaMat3A)

        from_rotation_y : function(number):(LuaMat3A)

        from_rotation_z : function(number):(LuaMat3A)

        from_translation : function(LuaVec2):(LuaMat3A)

        from_angle : function(number):(LuaMat3A)

        from_scale_angle_translation : function(LuaVec2 , number , LuaVec2):(LuaMat3A)

        from_scale : function(LuaVec2):(LuaMat3A)

        from_mat2 : function(LuaMat2):(LuaMat3A)

        __div : function(any , any):(any)

        __unm : function(any):(any)

        __sub : function(any , any):(any)

        __eq : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

    end
    
    
    record LuaMat4

        userdata
    
    --

        x_axis : LuaVec4

        y_axis : LuaVec4

        z_axis : LuaVec4

        w_axis : LuaVec4

        x_axis : LuaVec4

        y_axis : LuaVec4

        z_axis : LuaVec4

        w_axis : LuaVec4

        clone : function(self:LuaMat4):(LuaMat4)

        to_cols_array : function(self:LuaMat4):({number})

        to_cols_array_2d : function(self:LuaMat4):({{number}})

        col : function(self:LuaMat4 , integer):(LuaVec4)

        row : function(self:LuaMat4 , integer):(LuaVec4)

        is_finite : function(self:LuaMat4):(boolean)

        is_nan : function(self:LuaMat4):(boolean)

        transpose : function(self:LuaMat4):(LuaMat4)

        determinant : function(self:LuaMat4):(number)

        inverse : function(self:LuaMat4):(LuaMat4)

        project_point3 : function(self:LuaMat4 , LuaVec3):(LuaVec3)

        transform_point3 : function(self:LuaMat4 , LuaVec3):(LuaVec3)

        transform_vector3 : function(self:LuaMat4 , LuaVec3):(LuaVec3)

        transform_point3a : function(self:LuaMat4 , LuaVec3A):(LuaVec3A)

        transform_vector3a : function(self:LuaMat4 , LuaVec3A):(LuaVec3A)

        mul_vec4 : function(self:LuaMat4 , LuaVec4):(LuaVec4)

        mul_mat4 : function(self:LuaMat4 , LuaMat4):(LuaMat4)

        add_mat4 : function(self:LuaMat4 , LuaMat4):(LuaMat4)

        sub_mat4 : function(self:LuaMat4 , LuaMat4):(LuaMat4)

        mul_scalar : function(self:LuaMat4 , number):(LuaMat4)

        div_scalar : function(self:LuaMat4 , number):(LuaMat4)

        abs_diff_eq : function(self:LuaMat4 , LuaMat4 , number):(boolean)

        abs : function(self:LuaMat4):(LuaMat4)

        as_dmat4 : function(self:LuaMat4):(LuaDMat4)

        from_cols : function(LuaVec4 , LuaVec4 , LuaVec4 , LuaVec4):(LuaMat4)

        from_diagonal : function(LuaVec4):(LuaMat4)

        from_scale_rotation_translation : function(LuaVec3 , LuaQuat , LuaVec3):(LuaMat4)

        from_rotation_translation : function(LuaQuat , LuaVec3):(LuaMat4)

        from_quat : function(LuaQuat):(LuaMat4)

        from_mat3 : function(LuaMat3):(LuaMat4)

        from_mat3a : function(LuaMat3A):(LuaMat4)

        from_translation : function(LuaVec3):(LuaMat4)

        from_axis_angle : function(LuaVec3 , number):(LuaMat4)

        from_euler : function(LuaEulerRot , number , number , number):(LuaMat4)

        from_rotation_x : function(number):(LuaMat4)

        from_rotation_y : function(number):(LuaMat4)

        from_rotation_z : function(number):(LuaMat4)

        from_scale : function(LuaVec3):(LuaMat4)

        look_to_lh : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaMat4)

        look_to_rh : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaMat4)

        look_at_lh : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaMat4)

        look_at_rh : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaMat4)

        perspective_rh_gl : function(number , number , number , number):(LuaMat4)

        perspective_lh : function(number , number , number , number):(LuaMat4)

        perspective_rh : function(number , number , number , number):(LuaMat4)

        perspective_infinite_lh : function(number , number , number):(LuaMat4)

        perspective_infinite_reverse_lh : function(number , number , number):(LuaMat4)

        perspective_infinite_rh : function(number , number , number):(LuaMat4)

        perspective_infinite_reverse_rh : function(number , number , number):(LuaMat4)

        orthographic_rh_gl : function(number , number , number , number , number , number):(LuaMat4)

        orthographic_lh : function(number , number , number , number , number , number):(LuaMat4)

        orthographic_rh : function(number , number , number , number , number , number):(LuaMat4)

        __tostring : function(self:LuaMat4):(string)

        __index : function(self:LuaMat4 , integer):(LuaVec4)

        __mul : function(any , any):(any)

        __unm : function(any):(any)

        __add : function(any , any):(any)

        __sub : function(any , any):(any)

        __eq : function(any , any):(any)

        __div : function(any , any):(any)

    end
    
    
    record ClassLuaMat4

        userdata
    
    --Collection of static methods for [``].

        from_cols : function(LuaVec4 , LuaVec4 , LuaVec4 , LuaVec4):(LuaMat4)

        from_diagonal : function(LuaVec4):(LuaMat4)

        from_scale_rotation_translation : function(LuaVec3 , LuaQuat , LuaVec3):(LuaMat4)

        from_rotation_translation : function(LuaQuat , LuaVec3):(LuaMat4)

        from_quat : function(LuaQuat):(LuaMat4)

        from_mat3 : function(LuaMat3):(LuaMat4)

        from_mat3a : function(LuaMat3A):(LuaMat4)

        from_translation : function(LuaVec3):(LuaMat4)

        from_axis_angle : function(LuaVec3 , number):(LuaMat4)

        from_euler : function(LuaEulerRot , number , number , number):(LuaMat4)

        from_rotation_x : function(number):(LuaMat4)

        from_rotation_y : function(number):(LuaMat4)

        from_rotation_z : function(number):(LuaMat4)

        from_scale : function(LuaVec3):(LuaMat4)

        look_to_lh : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaMat4)

        look_to_rh : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaMat4)

        look_at_lh : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaMat4)

        look_at_rh : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaMat4)

        perspective_rh_gl : function(number , number , number , number):(LuaMat4)

        perspective_lh : function(number , number , number , number):(LuaMat4)

        perspective_rh : function(number , number , number , number):(LuaMat4)

        perspective_infinite_lh : function(number , number , number):(LuaMat4)

        perspective_infinite_reverse_lh : function(number , number , number):(LuaMat4)

        perspective_infinite_rh : function(number , number , number):(LuaMat4)

        perspective_infinite_reverse_rh : function(number , number , number):(LuaMat4)

        orthographic_rh_gl : function(number , number , number , number , number , number):(LuaMat4)

        orthographic_lh : function(number , number , number , number , number , number):(LuaMat4)

        orthographic_rh : function(number , number , number , number , number , number):(LuaMat4)

        __mul : function(any , any):(any)

        __unm : function(any):(any)

        __add : function(any , any):(any)

        __sub : function(any , any):(any)

        __eq : function(any , any):(any)

        __div : function(any , any):(any)

    end
    
    
    record LuaDMat2

        userdata
    
    --

        x_axis : LuaDVec2

        y_axis : LuaDVec2

        x_axis : LuaDVec2

        y_axis : LuaDVec2

        clone : function(self:LuaDMat2):(LuaDMat2)

        to_cols_array : function(self:LuaDMat2):({number})

        to_cols_array_2d : function(self:LuaDMat2):({{number}})

        col : function(self:LuaDMat2 , integer):(LuaDVec2)

        row : function(self:LuaDMat2 , integer):(LuaDVec2)

        is_finite : function(self:LuaDMat2):(boolean)

        is_nan : function(self:LuaDMat2):(boolean)

        transpose : function(self:LuaDMat2):(LuaDMat2)

        determinant : function(self:LuaDMat2):(number)

        inverse : function(self:LuaDMat2):(LuaDMat2)

        mul_vec2 : function(self:LuaDMat2 , LuaDVec2):(LuaDVec2)

        mul_mat2 : function(self:LuaDMat2 , LuaDMat2):(LuaDMat2)

        add_mat2 : function(self:LuaDMat2 , LuaDMat2):(LuaDMat2)

        sub_mat2 : function(self:LuaDMat2 , LuaDMat2):(LuaDMat2)

        mul_scalar : function(self:LuaDMat2 , number):(LuaDMat2)

        div_scalar : function(self:LuaDMat2 , number):(LuaDMat2)

        abs_diff_eq : function(self:LuaDMat2 , LuaDMat2 , number):(boolean)

        abs : function(self:LuaDMat2):(LuaDMat2)

        as_mat2 : function(self:LuaDMat2):(LuaMat2)

        from_cols : function(LuaDVec2 , LuaDVec2):(LuaDMat2)

        from_diagonal : function(LuaDVec2):(LuaDMat2)

        from_scale_angle : function(LuaDVec2 , number):(LuaDMat2)

        from_angle : function(number):(LuaDMat2)

        from_mat3 : function(LuaDMat3):(LuaDMat2)

        __tostring : function(self:LuaDMat2):(string)

        __index : function(self:LuaDMat2 , integer):(LuaDVec2)

        __eq : function(any , any):(any)

        __unm : function(any):(any)

        __div : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __sub : function(any , any):(any)

    end
    
    
    record ClassLuaDMat2

        userdata
    
    --Collection of static methods for [``].

        from_cols : function(LuaDVec2 , LuaDVec2):(LuaDMat2)

        from_diagonal : function(LuaDVec2):(LuaDMat2)

        from_scale_angle : function(LuaDVec2 , number):(LuaDMat2)

        from_angle : function(number):(LuaDMat2)

        from_mat3 : function(LuaDMat3):(LuaDMat2)

        __eq : function(any , any):(any)

        __unm : function(any):(any)

        __div : function(any , any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __sub : function(any , any):(any)

    end
    
    
    record LuaDMat3

        userdata
    
    --

        x_axis : LuaDVec3

        y_axis : LuaDVec3

        z_axis : LuaDVec3

        x_axis : LuaDVec3

        y_axis : LuaDVec3

        z_axis : LuaDVec3

        clone : function(self:LuaDMat3):(LuaDMat3)

        to_cols_array : function(self:LuaDMat3):({number})

        to_cols_array_2d : function(self:LuaDMat3):({{number}})

        col : function(self:LuaDMat3 , integer):(LuaDVec3)

        row : function(self:LuaDMat3 , integer):(LuaDVec3)

        is_finite : function(self:LuaDMat3):(boolean)

        is_nan : function(self:LuaDMat3):(boolean)

        transpose : function(self:LuaDMat3):(LuaDMat3)

        determinant : function(self:LuaDMat3):(number)

        inverse : function(self:LuaDMat3):(LuaDMat3)

        transform_point2 : function(self:LuaDMat3 , LuaDVec2):(LuaDVec2)

        transform_vector2 : function(self:LuaDMat3 , LuaDVec2):(LuaDVec2)

        mul_vec3 : function(self:LuaDMat3 , LuaDVec3):(LuaDVec3)

        mul_mat3 : function(self:LuaDMat3 , LuaDMat3):(LuaDMat3)

        add_mat3 : function(self:LuaDMat3 , LuaDMat3):(LuaDMat3)

        sub_mat3 : function(self:LuaDMat3 , LuaDMat3):(LuaDMat3)

        mul_scalar : function(self:LuaDMat3 , number):(LuaDMat3)

        div_scalar : function(self:LuaDMat3 , number):(LuaDMat3)

        abs_diff_eq : function(self:LuaDMat3 , LuaDMat3 , number):(boolean)

        abs : function(self:LuaDMat3):(LuaDMat3)

        as_mat3 : function(self:LuaDMat3):(LuaMat3)

        from_cols : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDMat3)

        from_diagonal : function(LuaDVec3):(LuaDMat3)

        from_mat4 : function(LuaDMat4):(LuaDMat3)

        from_quat : function(LuaDQuat):(LuaDMat3)

        from_axis_angle : function(LuaDVec3 , number):(LuaDMat3)

        from_euler : function(LuaEulerRot , number , number , number):(LuaDMat3)

        from_rotation_x : function(number):(LuaDMat3)

        from_rotation_y : function(number):(LuaDMat3)

        from_rotation_z : function(number):(LuaDMat3)

        from_translation : function(LuaDVec2):(LuaDMat3)

        from_angle : function(number):(LuaDMat3)

        from_scale_angle_translation : function(LuaDVec2 , number , LuaDVec2):(LuaDMat3)

        from_scale : function(LuaDVec2):(LuaDMat3)

        from_mat2 : function(LuaDMat2):(LuaDMat3)

        __tostring : function(self:LuaDMat3):(string)

        __index : function(self:LuaDMat3 , integer):(LuaDVec3)

        __add : function(any , any):(any)

        __sub : function(any , any):(any)

        __div : function(any , any):(any)

        __unm : function(any):(any)

        __eq : function(any , any):(any)

        __mul : function(any , any):(any)

    end
    
    
    record ClassLuaDMat3

        userdata
    
    --Collection of static methods for [``].

        from_cols : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDMat3)

        from_diagonal : function(LuaDVec3):(LuaDMat3)

        from_mat4 : function(LuaDMat4):(LuaDMat3)

        from_quat : function(LuaDQuat):(LuaDMat3)

        from_axis_angle : function(LuaDVec3 , number):(LuaDMat3)

        from_euler : function(LuaEulerRot , number , number , number):(LuaDMat3)

        from_rotation_x : function(number):(LuaDMat3)

        from_rotation_y : function(number):(LuaDMat3)

        from_rotation_z : function(number):(LuaDMat3)

        from_translation : function(LuaDVec2):(LuaDMat3)

        from_angle : function(number):(LuaDMat3)

        from_scale_angle_translation : function(LuaDVec2 , number , LuaDVec2):(LuaDMat3)

        from_scale : function(LuaDVec2):(LuaDMat3)

        from_mat2 : function(LuaDMat2):(LuaDMat3)

        __add : function(any , any):(any)

        __sub : function(any , any):(any)

        __div : function(any , any):(any)

        __unm : function(any):(any)

        __eq : function(any , any):(any)

        __mul : function(any , any):(any)

    end
    
    
    record LuaDMat4

        userdata
    
    --

        x_axis : LuaDVec4

        y_axis : LuaDVec4

        z_axis : LuaDVec4

        w_axis : LuaDVec4

        x_axis : LuaDVec4

        y_axis : LuaDVec4

        z_axis : LuaDVec4

        w_axis : LuaDVec4

        clone : function(self:LuaDMat4):(LuaDMat4)

        to_cols_array : function(self:LuaDMat4):({number})

        to_cols_array_2d : function(self:LuaDMat4):({{number}})

        col : function(self:LuaDMat4 , integer):(LuaDVec4)

        row : function(self:LuaDMat4 , integer):(LuaDVec4)

        is_finite : function(self:LuaDMat4):(boolean)

        is_nan : function(self:LuaDMat4):(boolean)

        transpose : function(self:LuaDMat4):(LuaDMat4)

        determinant : function(self:LuaDMat4):(number)

        inverse : function(self:LuaDMat4):(LuaDMat4)

        project_point3 : function(self:LuaDMat4 , LuaDVec3):(LuaDVec3)

        transform_point3 : function(self:LuaDMat4 , LuaDVec3):(LuaDVec3)

        transform_vector3 : function(self:LuaDMat4 , LuaDVec3):(LuaDVec3)

        mul_vec4 : function(self:LuaDMat4 , LuaDVec4):(LuaDVec4)

        mul_mat4 : function(self:LuaDMat4 , LuaDMat4):(LuaDMat4)

        add_mat4 : function(self:LuaDMat4 , LuaDMat4):(LuaDMat4)

        sub_mat4 : function(self:LuaDMat4 , LuaDMat4):(LuaDMat4)

        mul_scalar : function(self:LuaDMat4 , number):(LuaDMat4)

        div_scalar : function(self:LuaDMat4 , number):(LuaDMat4)

        abs_diff_eq : function(self:LuaDMat4 , LuaDMat4 , number):(boolean)

        abs : function(self:LuaDMat4):(LuaDMat4)

        as_mat4 : function(self:LuaDMat4):(LuaMat4)

        from_cols : function(LuaDVec4 , LuaDVec4 , LuaDVec4 , LuaDVec4):(LuaDMat4)

        from_diagonal : function(LuaDVec4):(LuaDMat4)

        from_scale_rotation_translation : function(LuaDVec3 , LuaDQuat , LuaDVec3):(LuaDMat4)

        from_rotation_translation : function(LuaDQuat , LuaDVec3):(LuaDMat4)

        from_quat : function(LuaDQuat):(LuaDMat4)

        from_mat3 : function(LuaDMat3):(LuaDMat4)

        from_translation : function(LuaDVec3):(LuaDMat4)

        from_axis_angle : function(LuaDVec3 , number):(LuaDMat4)

        from_euler : function(LuaEulerRot , number , number , number):(LuaDMat4)

        from_rotation_x : function(number):(LuaDMat4)

        from_rotation_y : function(number):(LuaDMat4)

        from_rotation_z : function(number):(LuaDMat4)

        from_scale : function(LuaDVec3):(LuaDMat4)

        look_to_lh : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDMat4)

        look_to_rh : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDMat4)

        look_at_lh : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDMat4)

        look_at_rh : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDMat4)

        perspective_rh_gl : function(number , number , number , number):(LuaDMat4)

        perspective_lh : function(number , number , number , number):(LuaDMat4)

        perspective_rh : function(number , number , number , number):(LuaDMat4)

        perspective_infinite_lh : function(number , number , number):(LuaDMat4)

        perspective_infinite_reverse_lh : function(number , number , number):(LuaDMat4)

        perspective_infinite_rh : function(number , number , number):(LuaDMat4)

        perspective_infinite_reverse_rh : function(number , number , number):(LuaDMat4)

        orthographic_rh_gl : function(number , number , number , number , number , number):(LuaDMat4)

        orthographic_lh : function(number , number , number , number , number , number):(LuaDMat4)

        orthographic_rh : function(number , number , number , number , number , number):(LuaDMat4)

        __tostring : function(self:LuaDMat4):(string)

        __index : function(self:LuaDMat4 , integer):(LuaDVec4)

        __add : function(any , any):(any)

        __unm : function(any):(any)

        __sub : function(any , any):(any)

        __mul : function(any , any):(any)

        __eq : function(any , any):(any)

        __div : function(any , any):(any)

    end
    
    
    record ClassLuaDMat4

        userdata
    
    --Collection of static methods for [``].

        from_cols : function(LuaDVec4 , LuaDVec4 , LuaDVec4 , LuaDVec4):(LuaDMat4)

        from_diagonal : function(LuaDVec4):(LuaDMat4)

        from_scale_rotation_translation : function(LuaDVec3 , LuaDQuat , LuaDVec3):(LuaDMat4)

        from_rotation_translation : function(LuaDQuat , LuaDVec3):(LuaDMat4)

        from_quat : function(LuaDQuat):(LuaDMat4)

        from_mat3 : function(LuaDMat3):(LuaDMat4)

        from_translation : function(LuaDVec3):(LuaDMat4)

        from_axis_angle : function(LuaDVec3 , number):(LuaDMat4)

        from_euler : function(LuaEulerRot , number , number , number):(LuaDMat4)

        from_rotation_x : function(number):(LuaDMat4)

        from_rotation_y : function(number):(LuaDMat4)

        from_rotation_z : function(number):(LuaDMat4)

        from_scale : function(LuaDVec3):(LuaDMat4)

        look_to_lh : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDMat4)

        look_to_rh : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDMat4)

        look_at_lh : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDMat4)

        look_at_rh : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDMat4)

        perspective_rh_gl : function(number , number , number , number):(LuaDMat4)

        perspective_lh : function(number , number , number , number):(LuaDMat4)

        perspective_rh : function(number , number , number , number):(LuaDMat4)

        perspective_infinite_lh : function(number , number , number):(LuaDMat4)

        perspective_infinite_reverse_lh : function(number , number , number):(LuaDMat4)

        perspective_infinite_rh : function(number , number , number):(LuaDMat4)

        perspective_infinite_reverse_rh : function(number , number , number):(LuaDMat4)

        orthographic_rh_gl : function(number , number , number , number , number , number):(LuaDMat4)

        orthographic_lh : function(number , number , number , number , number , number):(LuaDMat4)

        orthographic_rh : function(number , number , number , number , number , number):(LuaDMat4)

        __add : function(any , any):(any)

        __unm : function(any):(any)

        __sub : function(any , any):(any)

        __mul : function(any , any):(any)

        __eq : function(any , any):(any)

        __div : function(any , any):(any)

    end
    
    
    record LuaAffine2

        userdata
    
    --

        matrix2 : LuaMat2

        translation : LuaVec2

        matrix2 : LuaMat2

        translation : LuaVec2

        to_cols_array : function(self:LuaAffine2):({number})

        to_cols_array_2d : function(self:LuaAffine2):({{number}})

        transform_point2 : function(self:LuaAffine2 , LuaVec2):(LuaVec2)

        transform_vector2 : function(self:LuaAffine2 , LuaVec2):(LuaVec2)

        is_finite : function(self:LuaAffine2):(boolean)

        is_nan : function(self:LuaAffine2):(boolean)

        abs_diff_eq : function(self:LuaAffine2 , LuaAffine2 , number):(boolean)

        inverse : function(self:LuaAffine2):(LuaAffine2)

        clone : function(self:LuaAffine2):(LuaAffine2)

        from_cols : function(LuaVec2 , LuaVec2 , LuaVec2):(LuaAffine2)

        from_scale : function(LuaVec2):(LuaAffine2)

        from_angle : function(number):(LuaAffine2)

        from_translation : function(LuaVec2):(LuaAffine2)

        from_mat2 : function(LuaMat2):(LuaAffine2)

        from_mat2_translation : function(LuaMat2 , LuaVec2):(LuaAffine2)

        from_scale_angle_translation : function(LuaVec2 , number , LuaVec2):(LuaAffine2)

        from_angle_translation : function(number , LuaVec2):(LuaAffine2)

        from_mat3 : function(LuaMat3):(LuaAffine2)

        from_mat3a : function(LuaMat3A):(LuaAffine2)

        __tostring : function(self:LuaAffine2):(string)

        __eq : function(any , any):(any)

        __mul : function(any , any):(any)

    end
    
    
    record ClassLuaAffine2

        userdata
    
    --Collection of static methods for [``].

        from_cols : function(LuaVec2 , LuaVec2 , LuaVec2):(LuaAffine2)

        from_scale : function(LuaVec2):(LuaAffine2)

        from_angle : function(number):(LuaAffine2)

        from_translation : function(LuaVec2):(LuaAffine2)

        from_mat2 : function(LuaMat2):(LuaAffine2)

        from_mat2_translation : function(LuaMat2 , LuaVec2):(LuaAffine2)

        from_scale_angle_translation : function(LuaVec2 , number , LuaVec2):(LuaAffine2)

        from_angle_translation : function(number , LuaVec2):(LuaAffine2)

        from_mat3 : function(LuaMat3):(LuaAffine2)

        from_mat3a : function(LuaMat3A):(LuaAffine2)

        __eq : function(any , any):(any)

        __mul : function(any , any):(any)

    end
    
    
    record LuaAffine3A

        userdata
    
    --

        matrix3 : LuaMat3A

        translation : LuaVec3A

        matrix3 : LuaMat3A

        translation : LuaVec3A

        to_cols_array : function(self:LuaAffine3A):({number})

        to_cols_array_2d : function(self:LuaAffine3A):({{number}})

        transform_point3 : function(self:LuaAffine3A , LuaVec3):(LuaVec3)

        transform_vector3 : function(self:LuaAffine3A , LuaVec3):(LuaVec3)

        transform_point3a : function(self:LuaAffine3A , LuaVec3A):(LuaVec3A)

        transform_vector3a : function(self:LuaAffine3A , LuaVec3A):(LuaVec3A)

        is_finite : function(self:LuaAffine3A):(boolean)

        is_nan : function(self:LuaAffine3A):(boolean)

        abs_diff_eq : function(self:LuaAffine3A , LuaAffine3A , number):(boolean)

        inverse : function(self:LuaAffine3A):(LuaAffine3A)

        clone : function(self:LuaAffine3A):(LuaAffine3A)

        from_cols : function(LuaVec3A , LuaVec3A , LuaVec3A , LuaVec3A):(LuaAffine3A)

        from_scale : function(LuaVec3):(LuaAffine3A)

        from_quat : function(LuaQuat):(LuaAffine3A)

        from_axis_angle : function(LuaVec3 , number):(LuaAffine3A)

        from_rotation_x : function(number):(LuaAffine3A)

        from_rotation_y : function(number):(LuaAffine3A)

        from_rotation_z : function(number):(LuaAffine3A)

        from_translation : function(LuaVec3):(LuaAffine3A)

        from_mat3 : function(LuaMat3):(LuaAffine3A)

        from_mat3_translation : function(LuaMat3 , LuaVec3):(LuaAffine3A)

        from_scale_rotation_translation : function(LuaVec3 , LuaQuat , LuaVec3):(LuaAffine3A)

        from_rotation_translation : function(LuaQuat , LuaVec3):(LuaAffine3A)

        from_mat4 : function(LuaMat4):(LuaAffine3A)

        look_to_lh : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaAffine3A)

        look_to_rh : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaAffine3A)

        look_at_lh : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaAffine3A)

        look_at_rh : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaAffine3A)

        __tostring : function(self:LuaAffine3A):(string)

        __eq : function(any , any):(any)

        __mul : function(any , any):(any)

    end
    
    
    record ClassLuaAffine3A

        userdata
    
    --Collection of static methods for [``].

        from_cols : function(LuaVec3A , LuaVec3A , LuaVec3A , LuaVec3A):(LuaAffine3A)

        from_scale : function(LuaVec3):(LuaAffine3A)

        from_quat : function(LuaQuat):(LuaAffine3A)

        from_axis_angle : function(LuaVec3 , number):(LuaAffine3A)

        from_rotation_x : function(number):(LuaAffine3A)

        from_rotation_y : function(number):(LuaAffine3A)

        from_rotation_z : function(number):(LuaAffine3A)

        from_translation : function(LuaVec3):(LuaAffine3A)

        from_mat3 : function(LuaMat3):(LuaAffine3A)

        from_mat3_translation : function(LuaMat3 , LuaVec3):(LuaAffine3A)

        from_scale_rotation_translation : function(LuaVec3 , LuaQuat , LuaVec3):(LuaAffine3A)

        from_rotation_translation : function(LuaQuat , LuaVec3):(LuaAffine3A)

        from_mat4 : function(LuaMat4):(LuaAffine3A)

        look_to_lh : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaAffine3A)

        look_to_rh : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaAffine3A)

        look_at_lh : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaAffine3A)

        look_at_rh : function(LuaVec3 , LuaVec3 , LuaVec3):(LuaAffine3A)

        __eq : function(any , any):(any)

        __mul : function(any , any):(any)

    end
    
    
    record LuaDAffine2

        userdata
    
    --

        matrix2 : LuaDMat2

        translation : LuaDVec2

        matrix2 : LuaDMat2

        translation : LuaDVec2

        to_cols_array : function(self:LuaDAffine2):({number})

        to_cols_array_2d : function(self:LuaDAffine2):({{number}})

        transform_point2 : function(self:LuaDAffine2 , LuaDVec2):(LuaDVec2)

        transform_vector2 : function(self:LuaDAffine2 , LuaDVec2):(LuaDVec2)

        is_finite : function(self:LuaDAffine2):(boolean)

        is_nan : function(self:LuaDAffine2):(boolean)

        abs_diff_eq : function(self:LuaDAffine2 , LuaDAffine2 , number):(boolean)

        inverse : function(self:LuaDAffine2):(LuaDAffine2)

        clone : function(self:LuaDAffine2):(LuaDAffine2)

        from_cols : function(LuaDVec2 , LuaDVec2 , LuaDVec2):(LuaDAffine2)

        from_scale : function(LuaDVec2):(LuaDAffine2)

        from_angle : function(number):(LuaDAffine2)

        from_translation : function(LuaDVec2):(LuaDAffine2)

        from_mat2 : function(LuaDMat2):(LuaDAffine2)

        from_mat2_translation : function(LuaDMat2 , LuaDVec2):(LuaDAffine2)

        from_scale_angle_translation : function(LuaDVec2 , number , LuaDVec2):(LuaDAffine2)

        from_angle_translation : function(number , LuaDVec2):(LuaDAffine2)

        from_mat3 : function(LuaDMat3):(LuaDAffine2)

        __tostring : function(self:LuaDAffine2):(string)

        __mul : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaDAffine2

        userdata
    
    --Collection of static methods for [``].

        from_cols : function(LuaDVec2 , LuaDVec2 , LuaDVec2):(LuaDAffine2)

        from_scale : function(LuaDVec2):(LuaDAffine2)

        from_angle : function(number):(LuaDAffine2)

        from_translation : function(LuaDVec2):(LuaDAffine2)

        from_mat2 : function(LuaDMat2):(LuaDAffine2)

        from_mat2_translation : function(LuaDMat2 , LuaDVec2):(LuaDAffine2)

        from_scale_angle_translation : function(LuaDVec2 , number , LuaDVec2):(LuaDAffine2)

        from_angle_translation : function(number , LuaDVec2):(LuaDAffine2)

        from_mat3 : function(LuaDMat3):(LuaDAffine2)

        __mul : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record LuaDAffine3

        userdata
    
    --

        matrix3 : LuaDMat3

        translation : LuaDVec3

        matrix3 : LuaDMat3

        translation : LuaDVec3

        to_cols_array : function(self:LuaDAffine3):({number})

        to_cols_array_2d : function(self:LuaDAffine3):({{number}})

        transform_point3 : function(self:LuaDAffine3 , LuaDVec3):(LuaDVec3)

        transform_vector3 : function(self:LuaDAffine3 , LuaDVec3):(LuaDVec3)

        is_finite : function(self:LuaDAffine3):(boolean)

        is_nan : function(self:LuaDAffine3):(boolean)

        abs_diff_eq : function(self:LuaDAffine3 , LuaDAffine3 , number):(boolean)

        inverse : function(self:LuaDAffine3):(LuaDAffine3)

        clone : function(self:LuaDAffine3):(LuaDAffine3)

        from_cols : function(LuaDVec3 , LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDAffine3)

        from_scale : function(LuaDVec3):(LuaDAffine3)

        from_quat : function(LuaDQuat):(LuaDAffine3)

        from_axis_angle : function(LuaDVec3 , number):(LuaDAffine3)

        from_rotation_x : function(number):(LuaDAffine3)

        from_rotation_y : function(number):(LuaDAffine3)

        from_rotation_z : function(number):(LuaDAffine3)

        from_translation : function(LuaDVec3):(LuaDAffine3)

        from_mat3 : function(LuaDMat3):(LuaDAffine3)

        from_mat3_translation : function(LuaDMat3 , LuaDVec3):(LuaDAffine3)

        from_scale_rotation_translation : function(LuaDVec3 , LuaDQuat , LuaDVec3):(LuaDAffine3)

        from_rotation_translation : function(LuaDQuat , LuaDVec3):(LuaDAffine3)

        from_mat4 : function(LuaDMat4):(LuaDAffine3)

        look_to_lh : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDAffine3)

        look_to_rh : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDAffine3)

        look_at_lh : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDAffine3)

        look_at_rh : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDAffine3)

        __tostring : function(self:LuaDAffine3):(string)

        __eq : function(any , any):(any)

        __mul : function(any , any):(any)

    end
    
    
    record ClassLuaDAffine3

        userdata
    
    --Collection of static methods for [``].

        from_cols : function(LuaDVec3 , LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDAffine3)

        from_scale : function(LuaDVec3):(LuaDAffine3)

        from_quat : function(LuaDQuat):(LuaDAffine3)

        from_axis_angle : function(LuaDVec3 , number):(LuaDAffine3)

        from_rotation_x : function(number):(LuaDAffine3)

        from_rotation_y : function(number):(LuaDAffine3)

        from_rotation_z : function(number):(LuaDAffine3)

        from_translation : function(LuaDVec3):(LuaDAffine3)

        from_mat3 : function(LuaDMat3):(LuaDAffine3)

        from_mat3_translation : function(LuaDMat3 , LuaDVec3):(LuaDAffine3)

        from_scale_rotation_translation : function(LuaDVec3 , LuaDQuat , LuaDVec3):(LuaDAffine3)

        from_rotation_translation : function(LuaDQuat , LuaDVec3):(LuaDAffine3)

        from_mat4 : function(LuaDMat4):(LuaDAffine3)

        look_to_lh : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDAffine3)

        look_to_rh : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDAffine3)

        look_at_lh : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDAffine3)

        look_at_rh : function(LuaDVec3 , LuaDVec3 , LuaDVec3):(LuaDAffine3)

        __eq : function(any , any):(any)

        __mul : function(any , any):(any)

    end
    
    
    record LuaDQuat

        userdata
    
    --

        x : number

        y : number

        z : number

        w : number

        x : number

        y : number

        z : number

        w : number

        to_scaled_axis : function(self:LuaDQuat):(LuaDVec3)

        to_euler : function(self:LuaDQuat , LuaEulerRot):(number , number , number)

        to_array : function(self:LuaDQuat):({number})

        xyz : function(self:LuaDQuat):(LuaDVec3)

        conjugate : function(self:LuaDQuat):(LuaDQuat)

        inverse : function(self:LuaDQuat):(LuaDQuat)

        dot : function(self:LuaDQuat , LuaDQuat):(number)

        length : function(self:LuaDQuat):(number)

        length_squared : function(self:LuaDQuat):(number)

        length_recip : function(self:LuaDQuat):(number)

        normalize : function(self:LuaDQuat):(LuaDQuat)

        is_finite : function(self:LuaDQuat):(boolean)

        is_nan : function(self:LuaDQuat):(boolean)

        is_normalized : function(self:LuaDQuat):(boolean)

        is_near_identity : function(self:LuaDQuat):(boolean)

        angle_between : function(self:LuaDQuat , LuaDQuat):(number)

        abs_diff_eq : function(self:LuaDQuat , LuaDQuat , number):(boolean)

        lerp : function(self:LuaDQuat , LuaDQuat , number):(LuaDQuat)

        slerp : function(self:LuaDQuat , LuaDQuat , number):(LuaDQuat)

        mul_vec3 : function(self:LuaDQuat , LuaDVec3):(LuaDVec3)

        mul_quat : function(self:LuaDQuat , LuaDQuat):(LuaDQuat)

        as_quat : function(self:LuaDQuat):(LuaQuat)

        as_f32 : function(self:LuaDQuat):(LuaQuat)

        clone : function(self:LuaDQuat):(LuaDQuat)

        from_xyzw : function(number , number , number , number):(LuaDQuat)

        from_array : function({number}):(LuaDQuat)

        from_vec4 : function(LuaDVec4):(LuaDQuat)

        from_axis_angle : function(LuaDVec3 , number):(LuaDQuat)

        from_scaled_axis : function(LuaDVec3):(LuaDQuat)

        from_rotation_x : function(number):(LuaDQuat)

        from_rotation_y : function(number):(LuaDQuat)

        from_rotation_z : function(number):(LuaDQuat)

        from_euler : function(LuaEulerRot , number , number , number):(LuaDQuat)

        from_mat3 : function(LuaDMat3):(LuaDQuat)

        from_mat4 : function(LuaDMat4):(LuaDQuat)

        from_rotation_arc : function(LuaDVec3 , LuaDVec3):(LuaDQuat)

        from_rotation_arc_colinear : function(LuaDVec3 , LuaDVec3):(LuaDQuat)

        from_rotation_arc_2d : function(LuaDVec2 , LuaDVec2):(LuaDQuat)

        from_affine3 : function(LuaDAffine3):(LuaDQuat)

        __tostring : function(self:LuaDQuat):(string)

        __sub : function(any , any):(any)

        __unm : function(any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __div : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaDQuat

        userdata
    
    --Collection of static methods for [``].

        from_xyzw : function(number , number , number , number):(LuaDQuat)

        from_array : function({number}):(LuaDQuat)

        from_vec4 : function(LuaDVec4):(LuaDQuat)

        from_axis_angle : function(LuaDVec3 , number):(LuaDQuat)

        from_scaled_axis : function(LuaDVec3):(LuaDQuat)

        from_rotation_x : function(number):(LuaDQuat)

        from_rotation_y : function(number):(LuaDQuat)

        from_rotation_z : function(number):(LuaDQuat)

        from_euler : function(LuaEulerRot , number , number , number):(LuaDQuat)

        from_mat3 : function(LuaDMat3):(LuaDQuat)

        from_mat4 : function(LuaDMat4):(LuaDQuat)

        from_rotation_arc : function(LuaDVec3 , LuaDVec3):(LuaDQuat)

        from_rotation_arc_colinear : function(LuaDVec3 , LuaDVec3):(LuaDQuat)

        from_rotation_arc_2d : function(LuaDVec2 , LuaDVec2):(LuaDQuat)

        from_affine3 : function(LuaDAffine3):(LuaDQuat)

        __sub : function(any , any):(any)

        __unm : function(any):(any)

        __mul : function(any , any):(any)

        __add : function(any , any):(any)

        __div : function(any , any):(any)

        __eq : function(any , any):(any)

    end
    
    
    record LuaEulerRot

        userdata
    
    --

        clone : function(self:LuaEulerRot):(LuaEulerRot)

        assert_receiver_is_total_eq : function(self:LuaEulerRot)

        __tostring : function(self:LuaEulerRot):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaBVec3A

        userdata
    
    --

        bitmask : function(self:LuaBVec3A):(integer)

        any : function(self:LuaBVec3A):(boolean)

        all : function(self:LuaBVec3A):(boolean)

        test : function(self:LuaBVec3A , integer):(boolean)

        clone : function(self:LuaBVec3A):(LuaBVec3A)

        set : function(self:LuaBVec3A , integer , boolean)

        new : function(boolean , boolean , boolean):(LuaBVec3A)

        splat : function(boolean):(LuaBVec3A)

        from_array : function({boolean}):(LuaBVec3A)

        __tostring : function(self:LuaBVec3A):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaBVec3A

        userdata
    
    --Collection of static methods for [``].

        new : function(boolean , boolean , boolean):(LuaBVec3A)

        splat : function(boolean):(LuaBVec3A)

        from_array : function({boolean}):(LuaBVec3A)

        __eq : function(any , any):(any)

    end
    
    
    record LuaBVec4A

        userdata
    
    --

        clone : function(self:LuaBVec4A):(LuaBVec4A)

        bitmask : function(self:LuaBVec4A):(integer)

        any : function(self:LuaBVec4A):(boolean)

        all : function(self:LuaBVec4A):(boolean)

        test : function(self:LuaBVec4A , integer):(boolean)

        set : function(self:LuaBVec4A , integer , boolean)

        new : function(boolean , boolean , boolean , boolean):(LuaBVec4A)

        splat : function(boolean):(LuaBVec4A)

        from_array : function({boolean}):(LuaBVec4A)

        __tostring : function(self:LuaBVec4A):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaBVec4A

        userdata
    
    --Collection of static methods for [``].

        new : function(boolean , boolean , boolean , boolean):(LuaBVec4A)

        splat : function(boolean):(LuaBVec4A)

        from_array : function({boolean}):(LuaBVec4A)

        __eq : function(any , any):(any)

    end
    
    
    record LuaSmolStr

        userdata
    
    --

        to_string : function(self:LuaSmolStr):(string)

        len : function(self:LuaSmolStr):(integer)

        is_empty : function(self:LuaSmolStr):(boolean)

        is_heap_allocated : function(self:LuaSmolStr):(boolean)

        clone : function(self:LuaSmolStr):(LuaSmolStr)

        __tostring : function(self:LuaSmolStr):(string)

        __eq : function(any , any):(any)

    end
    
    
    record LuaUuid

        userdata
    
    --

        get_version_num : function(self:LuaUuid):(integer)

        as_u128 : function(self:LuaUuid):(integer)

        to_u128_le : function(self:LuaUuid):(integer)

        as_u64_pair : function(self:LuaUuid):(integer , integer)

        into_bytes : function(self:LuaUuid):({integer})

        to_bytes_le : function(self:LuaUuid):({integer})

        is_nil : function(self:LuaUuid):(boolean)

        is_max : function(self:LuaUuid):(boolean)

        get_node_id : function(self:LuaUuid):({integer})

        assert_receiver_is_total_eq : function(self:LuaUuid)

        clone : function(self:LuaUuid):(LuaUuid)

        encode_buffer : function():({integer})

        nil : function():(LuaUuid)

        max : function():(LuaUuid)

        from_u128 : function(integer):(LuaUuid)

        from_u128_le : function(integer):(LuaUuid)

        from_u64_pair : function(integer , integer):(LuaUuid)

        from_bytes : function({integer}):(LuaUuid)

        from_bytes_le : function({integer}):(LuaUuid)

        new_v4 : function():(LuaUuid)

        __tostring : function(self:LuaUuid):(string)

        __eq : function(any , any):(any)

    end
    
    
    record ClassLuaUuid

        userdata
    
    --Collection of static methods for [``].

        encode_buffer : function():({integer})

        nil : function():(LuaUuid)

        max : function():(LuaUuid)

        from_u128 : function(integer):(LuaUuid)

        from_u128_le : function(integer):(LuaUuid)

        from_u64_pair : function(integer , integer):(LuaUuid)

        from_bytes : function({integer}):(LuaUuid)

        from_bytes_le : function({integer}):(LuaUuid)

        new_v4 : function():(LuaUuid)

        __eq : function(any , any):(any)

    end
    
end

    --

    global world : CoreBevyAPI.LuaWorld

    --

    global script : CoreBevyAPI.LuaScriptData

    --

    global entity : CoreBevyAPI.LuaEntity

    --

    global Entity : CoreBevyAPI.ClassLuaEntity

    --

    global ComponentId : CoreBevyAPI.ClassLuaComponentId

    --

    global Tick : CoreBevyAPI.ClassLuaTick

    --

    global Identifier : CoreBevyAPI.ClassLuaIdentifier

    --

    global GlobalTransform : CoreBevyAPI.ClassLuaGlobalTransform

    --

    global Transform : CoreBevyAPI.ClassLuaTransform

    --

    global AspectRatio : CoreBevyAPI.ClassLuaAspectRatio

    --

    global Ray2d : CoreBevyAPI.ClassLuaRay2d

    --

    global Ray3d : CoreBevyAPI.ClassLuaRay3d

    --

    global Rot2 : CoreBevyAPI.ClassLuaRot2

    --

    global Dir2 : CoreBevyAPI.ClassLuaDir2

    --

    global Dir3 : CoreBevyAPI.ClassLuaDir3

    --

    global Dir3A : CoreBevyAPI.ClassLuaDir3A

    --

    global IRect : CoreBevyAPI.ClassLuaIRect

    --

    global Rect : CoreBevyAPI.ClassLuaRect

    --

    global URect : CoreBevyAPI.ClassLuaURect

    --

    global Aabb2d : CoreBevyAPI.ClassLuaAabb2d

    --

    global BoundingCircle : CoreBevyAPI.ClassLuaBoundingCircle

    --

    global Circle : CoreBevyAPI.ClassLuaCircle

    --

    global Arc2d : CoreBevyAPI.ClassLuaArc2d

    --

    global Capsule2d : CoreBevyAPI.ClassLuaCapsule2d

    --

    global CircularSector : CoreBevyAPI.ClassLuaCircularSector

    --

    global CircularSegment : CoreBevyAPI.ClassLuaCircularSegment

    --

    global Ellipse : CoreBevyAPI.ClassLuaEllipse

    --

    global Plane2d : CoreBevyAPI.ClassLuaPlane2d

    --

    global Rectangle : CoreBevyAPI.ClassLuaRectangle

    --

    global RegularPolygon : CoreBevyAPI.ClassLuaRegularPolygon

    --

    global Rhombus : CoreBevyAPI.ClassLuaRhombus

    --

    global Segment2d : CoreBevyAPI.ClassLuaSegment2d

    --

    global Triangle2d : CoreBevyAPI.ClassLuaTriangle2d

    --

    global Sphere : CoreBevyAPI.ClassLuaSphere

    --

    global Cuboid : CoreBevyAPI.ClassLuaCuboid

    --

    global Cylinder : CoreBevyAPI.ClassLuaCylinder

    --

    global Capsule3d : CoreBevyAPI.ClassLuaCapsule3d

    --

    global Segment3d : CoreBevyAPI.ClassLuaSegment3d

    --

    global Torus : CoreBevyAPI.ClassLuaTorus

    --

    global Triangle3d : CoreBevyAPI.ClassLuaTriangle3d

    --

    global RayCast2d : CoreBevyAPI.ClassLuaRayCast2d

    --

    global AabbCast2d : CoreBevyAPI.ClassLuaAabbCast2d

    --

    global BoundingCircleCast : CoreBevyAPI.ClassLuaBoundingCircleCast

    --

    global RayCast3d : CoreBevyAPI.ClassLuaRayCast3d

    --

    global AabbCast3d : CoreBevyAPI.ClassLuaAabbCast3d

    --

    global BoundingSphereCast : CoreBevyAPI.ClassLuaBoundingSphereCast

    --

    global Annulus : CoreBevyAPI.ClassLuaAnnulus

    --

    global Plane3d : CoreBevyAPI.ClassLuaPlane3d

    --

    global Tetrahedron : CoreBevyAPI.ClassLuaTetrahedron

    --

    global Gamepad : CoreBevyAPI.ClassLuaGamepad

    --

    global GamepadAxis : CoreBevyAPI.ClassLuaGamepadAxis

    --

    global GamepadButton : CoreBevyAPI.ClassLuaGamepadButton

    --

    global GamepadAxisChangedEvent : CoreBevyAPI.ClassLuaGamepadAxisChangedEvent

    --

    global GamepadButtonChangedEvent : CoreBevyAPI.ClassLuaGamepadButtonChangedEvent

    --

    global GamepadConnectionEvent : CoreBevyAPI.ClassLuaGamepadConnectionEvent

    --

    global Timer : CoreBevyAPI.ClassLuaTimer

    --

    global Stopwatch : CoreBevyAPI.ClassLuaStopwatch

    --

    global WindowPosition : CoreBevyAPI.ClassLuaWindowPosition

    --

    global WindowResolution : CoreBevyAPI.ClassLuaWindowResolution

    --

    global Duration : CoreBevyAPI.ClassLuaDuration

    --

    global Instant : CoreBevyAPI.ClassLuaInstant

    --

    global PathBuf : CoreBevyAPI.ClassLuaPathBuf

    --

    global Quat : CoreBevyAPI.ClassLuaQuat

    --

    global Vec3 : CoreBevyAPI.ClassLuaVec3

    --

    global IVec2 : CoreBevyAPI.ClassLuaIVec2

    --

    global IVec3 : CoreBevyAPI.ClassLuaIVec3

    --

    global IVec4 : CoreBevyAPI.ClassLuaIVec4

    --

    global I64Vec2 : CoreBevyAPI.ClassLuaI64Vec2

    --

    global I64Vec3 : CoreBevyAPI.ClassLuaI64Vec3

    --

    global I64Vec4 : CoreBevyAPI.ClassLuaI64Vec4

    --

    global UVec2 : CoreBevyAPI.ClassLuaUVec2

    --

    global UVec3 : CoreBevyAPI.ClassLuaUVec3

    --

    global UVec4 : CoreBevyAPI.ClassLuaUVec4

    --

    global U64Vec2 : CoreBevyAPI.ClassLuaU64Vec2

    --

    global U64Vec3 : CoreBevyAPI.ClassLuaU64Vec3

    --

    global U64Vec4 : CoreBevyAPI.ClassLuaU64Vec4

    --

    global Vec2 : CoreBevyAPI.ClassLuaVec2

    --

    global Vec3A : CoreBevyAPI.ClassLuaVec3A

    --

    global Vec4 : CoreBevyAPI.ClassLuaVec4

    --

    global BVec2 : CoreBevyAPI.ClassLuaBVec2

    --

    global BVec3 : CoreBevyAPI.ClassLuaBVec3

    --

    global BVec4 : CoreBevyAPI.ClassLuaBVec4

    --

    global DVec2 : CoreBevyAPI.ClassLuaDVec2

    --

    global DVec3 : CoreBevyAPI.ClassLuaDVec3

    --

    global DVec4 : CoreBevyAPI.ClassLuaDVec4

    --

    global Mat2 : CoreBevyAPI.ClassLuaMat2

    --

    global Mat3 : CoreBevyAPI.ClassLuaMat3

    --

    global Mat3A : CoreBevyAPI.ClassLuaMat3A

    --

    global Mat4 : CoreBevyAPI.ClassLuaMat4

    --

    global DMat2 : CoreBevyAPI.ClassLuaDMat2

    --

    global DMat3 : CoreBevyAPI.ClassLuaDMat3

    --

    global DMat4 : CoreBevyAPI.ClassLuaDMat4

    --

    global Affine2 : CoreBevyAPI.ClassLuaAffine2

    --

    global Affine3A : CoreBevyAPI.ClassLuaAffine3A

    --

    global DAffine2 : CoreBevyAPI.ClassLuaDAffine2

    --

    global DAffine3 : CoreBevyAPI.ClassLuaDAffine3

    --

    global DQuat : CoreBevyAPI.ClassLuaDQuat

    --

    global BVec3A : CoreBevyAPI.ClassLuaBVec3A

    --

    global BVec4A : CoreBevyAPI.ClassLuaBVec4A

    --

    global Uuid : CoreBevyAPI.ClassLuaUuid


return CoreBevyAPI