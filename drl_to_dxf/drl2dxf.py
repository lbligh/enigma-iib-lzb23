import argparse
import re
import pathlib
from ezdxf.addons import r12writer


def draw_lines(dxf_instance, width, height, radius):
    """Draw lines of bounding box"""
    starts = [
        (0, radius),
        (radius, height),
        (width, height - radius),
        (width - radius, 0),
    ]
    ends = [
        (0, height - radius),
        (width - radius, height),
        (width, radius),
        (radius, 0),
    ]

    for start, end in zip(starts, ends):
        dxf_instance.add_line(start=start, end=end, layer="box", color=7)


def draw_arcs(dxf_instance, width, height, radius):
    """Draw arcs of bounding box"""

    centers = [
        (radius, radius),
        (radius, height - radius),
        (width - radius, height - radius),
        (width - radius, radius),
    ]

    # arc goes ccw from start to end
    start_angles = [180, 90, 0, 270]
    end_angles = [(start + 90) % 360 for start in start_angles]

    for center, start, end in zip(centers, start_angles, end_angles):
        dxf_instance.add_arc(
            radius=radius,
            center=center,
            start=start,
            end=end,
            layer="box",
            color=7,
        )


def check_positive(value):
    """Checks if argument is >= 0"""
    ivalue = float(value)
    if ivalue <= 0:
        raise argparse.ArgumentTypeError(f"Negative value: {value} is not permissible")
    return ivalue


def get_args():
    """Gets the arguments given to the program"""
    parser = argparse.ArgumentParser(
        prog="drl2dxf",
        description="""Converts a .drl file to .dxf, with optional bounding box.
                        Requires a relative positioned .drl file as input.
                        If the bounding box is used, the origin is treated as 
                        the bottom left corner""",
        epilog="lzb23 2023",
    )
    parser.add_argument("input_file", help="Input File Location", type=pathlib.Path)
    parser.add_argument(
        "-o", "--output_file", help="Output File Location", type=pathlib.Path
    )
    parser.add_argument(
        "-b", "--box", help="Use bounding box (default False)", action="store_true"
    )
    parser.add_argument(
        "-W", "--width", help="Width in mm of bounding box", type=check_positive
    )
    parser.add_argument(
        "-H", "--height", help="Height in mm of bounding box", type=check_positive
    )
    parser.add_argument(
        "-R",
        "--radius",
        help="Radius in mm of bounding box corners",
        default=0,
        type=check_positive,
    )
    parser.add_argument(
        "-m",
        "--min_radius",
        help="Minimum radius in mm to plot, default 1.0",
        default=1.0,
        type=check_positive,
    )

    args = parser.parse_args()

    if not args.output_file:
        args.output_file = pathlib.Path(str(args.input_file)[:-4] + "_conv.dxf")

    if args.box:
        if not (args.width and args.height):
            parser.error("The width and height of the bounding box are required")

    return parser, args


def main():
    """Main function"""
    _, args = get_args()

    # drawing = dxf.drawing(args.output_file)
    with r12writer(args.output_file) as drawing:
        # drawing.add_layer("holes")

        tools = {}
        current_tool = None
        with args.input_file.open("r", encoding="utf-8") as file:
            for line in file.readlines():
                line = line.strip()
                match = re.match(r"^T(\d+)C(.+)$", line)
                if match:
                    tool_id = int(match.group(1))
                    size = float(match.group(2))
                    tools[tool_id] = size
                    continue
                match = re.match(r"^T(\d+)$", line)
                if match:
                    current_tool = int(match.group(1))
                    continue
                match = re.match("^X(.+)Y(.+)$", line)
                if match:
                    x = float(match.group(1))
                    y = float(match.group(2))
                    size = tools[current_tool]
                    if size >= args.min_radius:
                        drawing.add_circle(
                            radius=size / 2, center=(x, y), layer="holes", color=1
                        )

        if args.box:
            # lines
            draw_lines(drawing, args.width, args.height, args.radius)
            draw_arcs(drawing, args.width, args.height, args.radius)

        # print("Tools:")
        # print(tools)

    return 0


if __name__ == "__main__":
    main()
