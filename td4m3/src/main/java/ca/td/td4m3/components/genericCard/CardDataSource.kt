package ca.td.td4m3.components.genericCard

import com.ngam.rvabstractions.AbstractDataBindAdapter
import com.ngam.rvabstractions.AbstractPresenter

/**
 * This is the datasource for the card.
 */
data class CardDataSource<out Presenter: AbstractPresenter,
        out Adapter: AbstractDataBindAdapter>(
        val presenter: Presenter, // Mandatory
        val adapter: Adapter,  // Mandatory
        val cardTitle: String? = null) // Optional, if not provided, will hard title view