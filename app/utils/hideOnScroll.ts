import type { MotionValue } from "motion/react";

const hideOnScroll =
  (
    scrollY: MotionValue<number>,
    hideElement: React.Dispatch<React.SetStateAction<boolean>>
  ) =>
  (latest: number) => {
    const previous = scrollY.getPrevious();
    if (previous && latest > previous && latest > 150) {
      hideElement(true);
    } else {
      hideElement(false);
    }
  };

export default hideOnScroll;
