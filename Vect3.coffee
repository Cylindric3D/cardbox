# Returns true if "value" is an array, otherwise false
typeIsArray = Array.isArray || ( value ) -> return {}.toString.call( value ) is '[object Array]'

class Vect3
  _v = [0, 0, 0]
  
  constructor:(x, y, z)->
    @_v = [x, y, z]
    
  # Return an array representing this Vector3
  v: ->
    return @_v
    
  # Return the x-value of this Vector3
  x: ->
    return @_v[0]
    
  # Return the y-value of this Vector3
  y: ->
    return @_v[1]
    
  # Return the z-value of this Vector3
  z: ->
    return @_v[2]
  
  # Add v to this Vector3 and return the result
  # Does not modify this Vector3
  # v can be a Vector3, an array or a numeric value
  add:(v) ->
    v3 = @_paramToVect3(v)
    x = @_v[0]+v3.x()
    y = @_v[1]+v3.y()
    z = @_v[2]+v3.z()
    return new Vect3(x, y, z)
    
  # Subtract v from this Vector3 and return the result
  # Does not modify this Vector3
  # v can be a Vector3, an array or a numeric value
  subtract:(v) ->
    v3 = @_paramToVect3(v)
    x = @_v[0]-v3.x()
    y = @_v[1]-v3.y()
    z = @_v[2]-v3.z()
    return new Vect3(x, y, z)
    
  # Multiply this Vector3 by v and return the result
  # Does not modify this Vector3
  # v can be a Vector3, an array or a numeric value
  multiply:(v) ->
    v3 = @_paramToVect3(v)
    x = @_v[0]*v3.x()
    y = @_v[1]*v3.y()
    z = @_v[2]*v3.z()
    return new Vect3(x, y, z)
      
  # Dividy this Vector3 by v and return the result
  # Does not modify this Vector3
  # v can be a Vector3, an array or a numeric value
  divide:(v) ->
    v3 = @_paramToVect3(v)
    x = @_v[0]/v3.x()
    y = @_v[1]/v3.y()
    z = @_v[2]/v3.z()
    return new Vect3(x, y, z)
    
  # Return the length of this Vector3
  length:() ->
    return Math.sqrt((@_v[0] * @_v[0]) + (@_v[1] * @_v[1]) + (@_v[2] * @_v[2])) 

  # Return the normalized Vector3 of this Vector3
  normalize:() ->
    length = @length()
    x = @_v[0]/length
    y = @_v[1]/length
    z = @_v[2]/length
    return new Vect3(x, y, z)

  # Returns a string-representation of this Vector3
  string: ->
    return "<#{@x()}, #{@y()}, #{@z()}>"
  
  # Converts a value "p" to a Vector3
  # p can be a Vector3, an array or a numeric value
  _paramToVect3:(p)->
    if typeIsArray(p)
      return new Vect3(p[0], p[1], p[2])
    
    else if p instanceof Vect3
      return p
    
    else
      return new Vect3(p, p, p)
     
