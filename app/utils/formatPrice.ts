const formatPrice = (price: number): string =>
  price > 0 ? `£${price % 1 ? price.toPrecision(3) : price}` : "Free";

export default formatPrice;
