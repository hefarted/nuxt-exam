export type Hours = {
  day: string
  open: string
  close: string
}

export type Institution = {
  slug: string
  name: string
  address: string
  phone: string
  email: string
  description: string
  hours: Hours[]
  lat: number
  lng: number
}
