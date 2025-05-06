shader_type spatial;
render_mode cull_front, unshaded, world_vertex_coords;

// Настройки контура
uniform float outline_thickness = 0.03;
uniform float speed = 2.0;
uniform float noise_scale = 4.0;
uniform float alpha = 1.0;
uniform sampler2D fire_noise : source_color, repeat_enable;
uniform sampler2D color_ramp : source_color, repeat_enable, filter_linear_mipmap;

// Анимированный шум для огня
float animated_noise(vec2 uv) {
    float time_factor = TIME * speed;
    return texture(fire_noise, uv * noise_scale + vec2(time_factor * 0.3, time_factor * 0.7)).r;
}

void vertex() {
    // Динамическое смещение вершин на основе шума
    vec3 world_pos = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
    vec2 noise_uv = world_pos.xz * 0.5 + vec2(TIME * speed * 0.2);
    float displacement = animated_noise(noise_uv) * 0.1;
    
    VERTEX += NORMAL * (outline_thickness + displacement);
}

void fragment() {
    // Генерация огненного паттерна
    vec3 world_pos = (VIEW_MATRIX * vec4(VERTEX, 1.0)).xyz;
    vec2 fire_uv = world_pos.xz * 0.3 + vec2(TIME * speed, 0.0);
    
    // Многослойный шум для сложного эффекта
    float noise1 = animated_noise(fire_uv);
    float noise2 = animated_noise(fire_uv * 2.0 + vec2(0.2));
    float noise3 = animated_noise(fire_uv * 0.5 - vec2(TIME * 0.5));
    
    // Комбинирование шумов и нормализация
    float combined_noise = clamp((noise1 * 0.6 + noise2 * 0.3 + noise3 * 0.1), 0.0, 1.0);
    
    // Получение цвета из Color Ramp
    vec3 fire_color = texture(color_ramp, vec2(combined_noise, 0.0)).rgb;
    
    // Усиление контраста
    float ramp_pos = smoothstep(0.2, 0.8, combined_noise);
    fire_color = texture(color_ramp, vec2(ramp_pos, 0.0)).rgb;
    
    // Эффект "языков пламени"
    float flame_mask = step(0.5, combined_noise);
    fire_color *= 1.0 + flame_mask * 2.0;
    
    // Динамическая прозрачность с учетом нового параметра alpha
    ALPHA = smoothstep(0.2, 0.8, combined_noise) * alpha; // <-- Умножаем на alpha
    
    // Добавляем свечение с вариациями
    EMISSION = fire_color * (1.0 + sin(TIME * 10.0) * 0.3);
    ALBEDO = fire_color;
}