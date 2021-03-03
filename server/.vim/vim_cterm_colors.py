def greynum(x):
    if x < 14:
        return 0

    n = (x - 8) / 10
    m = (x - 8) % 10

    if m < 5:
        return n

    return n + 1


def greylvl(n):
    if n == 0:
        return 0

    return 8 + n * 10


def grey(n):
    if n == 0:
        return 16

    if n == 25:
        return 231

    return 231 + n


def rgbnum(x):
    if x < 75:
        return 0

    n = (x - 55) / 40
    m = (x - 55) % 40

    if m < 20:
        return n

    return n + 1


def rgblvl(n):
    if n == 0:
        return 0
    return 55 + n * 40


def rgb(r, g, b):
    return 16 + r * 36 + g * 6 + b


def color(r, g, b):
    # Get the closest grey
    gx = greynum(r)
    gy = greynum(g)
    gz = greynum(b)

    # Get the closest color
    x = rgbnum(r)
    y = rgbnum(g)
    z = rgbnum(b)

    level = r * r + g * g + b * b

    if gx == gy and gy == gz:
        # There are two possibilities
        dgr = greylvl(gx)
        dgg = greylvl(gy)
        dgb = greylvl(gz)
        dgrey = dgr * dgr + dgg * dgg + dgb * dgb - level

        dr = rgblvl(gx)
        dg = rgblvl(gy)
        db = rgblvl(gz)
        drgb = dr * dr + dg * dg + db * db - level

        if dgrey < drgb:
            # Use the gray value
            return grey(gx)

        # Use the color value
        return rgb(x, y, z)

    # Only one possibility
    return rgb(x, y, z)


def color_index(rgb_value):
    """
    Convert 0xRRGGBB to a terminal numeric index
    """
    r = rgb_value >> 16
    g = (rgb_value >> 8) & 255
    b = rgb_value & 255

    return color(r, g, b)


def main():
    rgb_number = '#ffffff'
    rgb_value = int(rgb_number[1:], 16)
    print(color_index(rgb_value))


if __name__ == '__main__':
    main()
