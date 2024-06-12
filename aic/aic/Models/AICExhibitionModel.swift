/*
Abstract:
Defines a data structure for AIC Exhibition Model
*/

import CoreLocation

class AICExhibitionModel: NSObject {
	let id: Int
	let title: String
	let shortDescription: String
	var imageUrl: URL?
	let startDate: Date
	let endDate: Date
	let galleryId: Int?
	let location: CoordinateWithFloor? // TODO: making this optional, it's not always available in the data

    init(
        id: Int,
        title: String,
        shortDescription: String,
        imageUrl: URL?,
        startDate: Date,
        endDate: Date,
        galleryId: Int?,
        location: CoordinateWithFloor?
    ) {
		self.id = id
		self.title = title
		self.shortDescription = shortDescription
		self.imageUrl = imageUrl
		self.startDate = startDate
		self.endDate = endDate
		self.galleryId = galleryId
		self.location = location
		super.init()
	}
}
