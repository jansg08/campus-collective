import type { FC } from "react";

interface SquareButtonProps {
  children: React.ReactNode
  type: "primary" | "secondary"
}
 
const SquareButton: FC<SquareButtonProps> = ({children, type}) => {
  return ( <button className={`bg-${type} p-1.5 rounded-lg shadow-lg hover:brightness-110 transition-all`}>{children}</button> );
}
 
export default SquareButton;