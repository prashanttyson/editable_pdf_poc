
package com.example.editable_pdf_poc

import android.os.Bundle
import com.pspdfkit.PSPDFKit
import io.flutter.embedding.android.FlutterAppCompatActivity

class MainActivity : FlutterAppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Initialize PSPDFKit
        PSPDFKit.initialize(this, "dQSix7bI5-TGe05ITXQ_ejnOcZUsQhgBAOrdCOCIEgY0nUGb5x7kkUFzKyYCyedcDqg0_NFIVQKnqIqpjVroA3rKZhIsQlXSh3gYqM90VMGJpBbSWCHfWYeaD4pf6fmT260KO48fIzfX4i211x3mTnw7QA2vUgdolNEvmvuete_DcAefjDBVFB5zQedKzeCbOhUs5yJ81097SYUj")
    }
}
