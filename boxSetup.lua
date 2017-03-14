boxSetup = Script({Box})

-- Box é a representação de uma "caixa" em 3D

function boxSetup:init(b)
    assert(b.pos, "Box needs Pos3D component")

    function b:rotate(drx, dry, drz)
        b.box.angles = Vector3(b.box.angles.x + drx, b.box.angles.y + dry, b.box.angles.z + drz)

        rotateAroundX(drx, b.box.vectors)
        rotateAroundY(dry, b.box.vectors)
        rotateAroundZ(drz, b.box.vectors)
    end

    function b:getAngles()
        return b.box.angles
    end

    function b:getPoints()
        return {
            a = Vector3(b.box.vectors.a.x+b.pos.x, b.box.vectors.a.y+b.pos.y, b.box.vectors.a.z+b.pos.z),
            b = Vector3(b.box.vectors.b.x+b.pos.x, b.box.vectors.b.y+b.pos.y, b.box.vectors.b.z+b.pos.z),
            c = Vector3(b.box.vectors.c.x+b.pos.x, b.box.vectors.c.y+b.pos.y, b.box.vectors.c.z+b.pos.z),
            d = Vector3(b.box.vectors.d.x+b.pos.x, b.box.vectors.d.y+b.pos.y, b.box.vectors.d.z+b.pos.z),
            e = Vector3(b.box.vectors.e.x+b.pos.x, b.box.vectors.e.y+b.pos.y, b.box.vectors.e.z+b.pos.z),
            f = Vector3(b.box.vectors.f.x+b.pos.x, b.box.vectors.f.y+b.pos.y, b.box.vectors.f.z+b.pos.z),
            g = Vector3(b.box.vectors.g.x+b.pos.x, b.box.vectors.g.y+b.pos.y, b.box.vectors.g.z+b.pos.z),
            h = Vector3(b.box.vectors.h.x+b.pos.x, b.box.vectors.h.y+b.pos.y, b.box.vectors.h.z+b.pos.z)
        }
    end

    b.box.vectors.a = Vector3(-b.box.size.x/2,  b.box.size.y/2, -b.box.size.z/2)
    b.box.vectors.b = Vector3(-b.box.size.x/2,  b.box.size.y/2,  b.box.size.z/2)
    b.box.vectors.c = Vector3( b.box.size.x/2,  b.box.size.y/2,  b.box.size.z/2)
    b.box.vectors.d = Vector3( b.box.size.x/2,  b.box.size.y/2, -b.box.size.z/2)
    b.box.vectors.e = Vector3(-b.box.size.x/2, -b.box.size.y/2, -b.box.size.z/2)
    b.box.vectors.f = Vector3(-b.box.size.x/2, -b.box.size.y/2,  b.box.size.z/2)
    b.box.vectors.g = Vector3( b.box.size.x/2, -b.box.size.y/2,  b.box.size.z/2)
    b.box.vectors.h = Vector3( b.box.size.x/2, -b.box.size.y/2, -b.box.size.z/2)

    print(b.box.angles.x.. " "..b.box.angles.y.." "..b.box.angles.z)
    b:rotate(b.box.angles.x, b.box.angles.y, b.box.angles.z)
end

local function rotate2D(dr, x, y)
    return math.cos(dr)*x - math.sin(dr)*y, math.sin(dr)*x + math.cos(dr)*y
end

function rotateAroundX(dr, vecs)
    vecs.a.z, vecs.a.y = rotate2D(dr, vecs.a.z, vecs.a.y)
    vecs.b.z, vecs.b.y = rotate2D(dr, vecs.b.z, vecs.b.y)
    vecs.c.z, vecs.c.y = rotate2D(dr, vecs.c.z, vecs.c.y)
    vecs.d.z, vecs.d.y = rotate2D(dr, vecs.d.z, vecs.d.y)
    vecs.e.z, vecs.e.y = rotate2D(dr, vecs.e.z, vecs.e.y)
    vecs.f.z, vecs.f.y = rotate2D(dr, vecs.f.z, vecs.f.y)
    vecs.g.z, vecs.g.y = rotate2D(dr, vecs.g.z, vecs.g.y)
    vecs.h.z, vecs.h.y = rotate2D(dr, vecs.h.z, vecs.h.y)
end

function rotateAroundY(dr, vecs)
    vecs.a.z, vecs.a.x = rotate2D(dr, vecs.a.z, vecs.a.x)
    vecs.b.z, vecs.b.x = rotate2D(dr, vecs.b.z, vecs.b.x)
    vecs.c.z, vecs.c.x = rotate2D(dr, vecs.c.z, vecs.c.x)
    vecs.d.z, vecs.d.x = rotate2D(dr, vecs.d.z, vecs.d.x)
    vecs.e.z, vecs.e.x = rotate2D(dr, vecs.e.z, vecs.e.x)
    vecs.f.z, vecs.f.x = rotate2D(dr, vecs.f.z, vecs.f.x)
    vecs.g.z, vecs.g.x = rotate2D(dr, vecs.g.z, vecs.g.x)
    vecs.h.z, vecs.h.x = rotate2D(dr, vecs.h.z, vecs.h.x)
end

function rotateAroundZ(dr, vecs)
    vecs.a.y, vecs.a.x = rotate2D(dr, vecs.a.y, vecs.a.x)
    vecs.b.y, vecs.b.x = rotate2D(dr, vecs.b.y, vecs.b.x)
    vecs.c.y, vecs.c.x = rotate2D(dr, vecs.c.y, vecs.c.x)
    vecs.d.y, vecs.d.x = rotate2D(dr, vecs.d.y, vecs.d.x)
    vecs.e.y, vecs.e.x = rotate2D(dr, vecs.e.y, vecs.e.x)
    vecs.f.y, vecs.f.x = rotate2D(dr, vecs.f.y, vecs.f.x)
    vecs.g.y, vecs.g.x = rotate2D(dr, vecs.g.y, vecs.g.x)
    vecs.h.y, vecs.h.x = rotate2D(dr, vecs.h.y, vecs.h.x)
end
