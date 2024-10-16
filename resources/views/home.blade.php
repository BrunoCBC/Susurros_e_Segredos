@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Bem-vindo ao nosso site!</h1>
    <p>Esta é a página inicial.</p>

    <h2>Sobre nós</h2>
    <p>Informações sobre o que fazemos...</p>

    <h2>Nossos Serviços</h2>
    <p>Detalhes sobre os serviços oferecidos...</p>

    <h2>Entre em contato</h2>
    <p><a href="{{ url('/faleconosco') }}">Fale Conosco</a></p>
</div>
@endsection
