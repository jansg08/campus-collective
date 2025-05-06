import { createEvent } from "ics";

interface generateIcsFileProps {
  title: string;
  description: string | null;
  venue: {
    name: string;
    coords: {
      x: number;
      y: number;
    } | null;
  } | null;
  startTime: Date;
  endTime: Date;
}

export function generateIcsFile(event: generateIcsFileProps) {
  const { title, description, venue, startTime, endTime } = event;
  console.log(event);
  const startArray = convertToArray(new Date(startTime));
  const endArray = convertToArray(new Date(endTime));
  createEvent(
    {
      title,
      description: description ? description : undefined,
      location: venue?.name,
      geo: venue?.coords
        ? { lat: venue.coords.y, lon: venue.coords.x }
        : undefined,
      start: startArray,
      end: endArray,
    },
    (error, value) => {
      if (error) {
        console.error(error);
        return;
      }

      const blob = new Blob([value], { type: "text/calendar;charset=utf-8" });
      const link = document.createElement("a");
      link.href = URL.createObjectURL(blob);
      link.download = `${title}.ics`;
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    }
  );
}

function convertToArray(date: Date): [number, number, number, number, number] {
  return [
    date.getUTCFullYear(),
    date.getUTCMonth() + 1,
    date.getUTCDate(),
    date.getUTCHours(),
    date.getUTCMinutes(),
  ];
}
