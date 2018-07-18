package ca.td.td4m3.dashboard.accountsCard.cardView

import android.content.Context
import android.util.AttributeSet
import ca.td.td4m3.components.genericCard.CardDataSource
import ca.td.td4m3.components.genericCard.GenericCardView
import ca.td.td4m3.dashboard.accountsCard.adapter.AccountsCardAdapter
import ca.td.td4m3.dashboard.accountsCard.presenter.AccountsCardPresenter

class AccountdCardView(context: Context, attrSet: AttributeSet?, defStyleAttr: Int):
        GenericCardView<AccountsCardPresenter, AccountsCardAdapter>(context, attrSet, defStyleAttr) {
    // Constructors for LinearLayout
    constructor(context: Context, attrSet: AttributeSet?): this(context, attrSet, 0)
    constructor(context: Context): this(context, null)

    override fun setDataSource(): CardDataSource<AccountsCardPresenter, AccountsCardAdapter> {
        presenter = AccountsCardPresenter()
        adapter = AccountsCardAdapter()
        return CardDataSource(presenter, adapter, "Accounts")
    }
}