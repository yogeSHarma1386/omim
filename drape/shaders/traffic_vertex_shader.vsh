attribute vec3 a_position;
attribute vec4 a_normal;
attribute vec4 a_colorTexCoord;

uniform mat4 modelView;
uniform mat4 projection;
uniform mat4 pivotTransform;

uniform vec4 u_trafficParams;

varying vec2 v_colorTexCoord;
varying vec2 v_maskTexCoord;
varying float v_halfLength;

const float kShapeCoordScalar = 1000.0;
const float kArrowVSize = 0.25;

void main(void)
{
  vec2 normal = a_normal.xy;
  float halfWidth = length(normal);
  vec2 transformedAxisPos = (vec4(a_position.xy, 0.0, 1.0) * modelView).xy;
  if (halfWidth != 0.0)
  {
    vec2 norm = normal * u_trafficParams.x;
    if (a_normal.z < 0.0)
      norm = normal * u_trafficParams.y;
    halfWidth = length(norm);

    vec4 glbShiftPos = vec4(a_position.xy + norm, 0.0, 1.0);
    vec2 shiftPos = (glbShiftPos * modelView).xy;
    transformedAxisPos = transformedAxisPos + normalize(shiftPos - transformedAxisPos) * halfWidth;
  }

  float uOffset = length(vec4(kShapeCoordScalar, 0, 0, 0) * modelView) * a_normal.w;
  v_colorTexCoord = a_colorTexCoord.xy;
  float v = mix(a_colorTexCoord.z, a_colorTexCoord.z + kArrowVSize, 0.5 * a_normal.z + 0.5);
  v_maskTexCoord = vec2(uOffset * u_trafficParams.z, v) * u_trafficParams.w;
  v_maskTexCoord.x *= step(a_colorTexCoord.w, v_maskTexCoord.x);
  v_halfLength = a_normal.z;
  vec4 pos = vec4(transformedAxisPos, a_position.z, 1.0) * projection;
  float w = pos.w;
  pos.xyw = (pivotTransform * vec4(pos.xy, 0.0, w)).xyw;
  pos.z *= pos.w / w;
  gl_Position = pos;
}
