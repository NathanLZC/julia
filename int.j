int8(x::Scalar) = box(Int8,to_int8(unbox(x)))
uint8(x::Scalar) = box(Uint8,to_uint8(unbox(x)))
int16(x::Scalar) = box(Int16,to_int16(unbox(x)))
uint16(x::Scalar) = box(Uint16,to_uint16(unbox(x)))
int32(x::Scalar) = box(Int32,to_int32(unbox(x)))
uint32(x::Scalar) = box(Uint32,to_uint32(unbox(x)))
int64(x::Scalar) = box(Int64,to_int64(unbox(x)))
uint64(x::Scalar) = box(Uint64,to_uint64(unbox(x)))

def_binary_op(Int64, {Int8, Uint8, Int16, Uint16, Int32, Uint32}, +, add_int64)
def_binary_op(Int64, {Int8, Uint8, Int16, Uint16, Int32, Uint32}, -, sub_int64)
def_binary_op(Int64, {Int8, Uint8, Int16, Uint16, Int32, Uint32}, *, mul_int64)
def_binary_op(Int64, {Int8, Uint8, Int16, Uint16, Int32, Uint32},div,div_int64)
def_binary_op(Int64, {Int8, Uint8, Int16, Uint16, Int32, Uint32},%,  mod_int64)

def_binary_op(Int32, {Int8, Uint8, Int16, Uint16}, +, add_int32)
def_binary_op(Int32, {Int8, Uint8, Int16, Uint16}, -, sub_int32)
def_binary_op(Int32, {Int8, Uint8, Int16, Uint16}, *, mul_int32)
def_binary_op(Int32, {Int8, Uint8, Int16, Uint16}, div, div_int32)
def_binary_op(Int32, {Int8, Uint8, Int16, Uint16}, %,   mod_int32)

def_binary_op(Int16, {Int8, Uint8}, +, add_int16)
def_binary_op(Int16, {Int8, Uint8}, -, sub_int16)
def_binary_op(Int16, {Int8, Uint8}, *, mul_int16)
def_binary_op(Int16, {Int8, Uint8}, div, div_int16)
def_binary_op(Int16, {Int8, Uint8}, %,   mod_int16)

def_binary_op(Int8, {}, +, add_int8)
def_binary_op(Int8, {}, -, sub_int8)
def_binary_op(Int8, {}, *, mul_int8)
def_binary_op(Int8, {}, div, div_int8)
def_binary_op(Int8, {}, %,   mod_int8)

#(+)(x::Int32, y::Int32) = box(Int32, add_int32(unbox(x), unbox(y)))
#(-)(x::Int32, y::Int32) = box(Int32, sub_int32(unbox(x), unbox(y)))
(-)(x::Int64) = box(Int64, neg_int64(unbox(x)))
(-)(x::Int32) = box(Int32, neg_int32(unbox(x)))
(-)(x::Int16) = box(Int16, neg_int16(unbox(x)))
(-)(x::Int8 ) = box(Int8 , neg_int8 (unbox(x)))
#(*)(x::Int32, y::Int32) = box(Int32, mul_int32(unbox(x), unbox(y)))
(/)(x::Int32, y::Int32) = float64(x)/float64(y)
(//)(x::Int32, y::Int32) = rational(x,y)
#div(x::Int32, y::Int32) = box(Int32, div_int32(unbox(x), unbox(y)))
#(%)(x::Int32, y::Int32) = box(Int32, mod_int32(unbox(x), unbox(y)))

def_compare_ops(Int32, {Int8, Uint8, Int16, Uint16}, lt_int32, eq_int32)
#<=(x::Int32, y::Int32) = lt_int32(unbox(x),unbox(y)) || eq_int32(unbox(x),unbox(y))
#< (x::Int32, y::Int32) = lt_int32(unbox(x),unbox(y))
#> (x::Int32, y::Int32) = lt_int32(unbox(y),unbox(x))
#>=(x::Int32, y::Int32) = (x>y) || eq_int32(unbox(x),unbox(y))
#==(x::Int32, y::Int32) = eq_int32(unbox(x),unbox(y))

Int64.convert(x::Int8) = int64(x)
Int64.convert(x::Uint8) = int64(x)
Int64.convert(x::Int16) = int64(x)
Int64.convert(x::Uint16) = int64(x)
Int64.convert(x::Int32) = int64(x)
Int64.convert(x::Uint32) = int64(x)
Int32.convert(x::Int8) = int32(x)
Int32.convert(x::Uint8) = int32(x)
Int32.convert(x::Int16) = int32(x)
Int32.convert(x::Uint16) = int32(x)
Int16.convert(x::Int8) = int16(x)
Int16.convert(x::Uint8) = int16(x)

function gcd(a::Int, b::Int)
    while b != 0
        t = b
        b = a % b
        a = t
    end
    return a
end
