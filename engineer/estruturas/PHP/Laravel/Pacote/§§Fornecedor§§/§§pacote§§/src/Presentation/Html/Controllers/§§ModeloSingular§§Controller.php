<?php

namespace §§Fornecedor§§\§§Pacote§§\Presentation\Html\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use §§Fornecedor§§\§§Pacote§§\Data\Services\§§ModeloSingular§§Service;
use §§Fornecedor§§\§§Pacote§§\Data\Requests\Store§§ModeloSingular§§Request;
use §§Fornecedor§§\§§Pacote§§\Presentation\Handler\§§ModeloSingular§§ShowHandler;
use §§Fornecedor§§\§§Pacote§§\Presentation\Handler\§§ModeloSingular§§IndexHandler;
use §§Fornecedor§§\§§Pacote§§\Presentation\Handler\§§ModeloSingular§§StoreHandler;
use §§Fornecedor§§\§§Pacote§§\Presentation\Handler\§§ModeloSingular§§DeleteHandler;
use §§Fornecedor§§\§§Pacote§§\Data\DataSources\RemoteMysql\§§ModeloSingular§§LocalStaticDataSourceRepository;
use §§Fornecedor§§\§§Pacote§§\Data\DataSources\RemoteMysql\§§ModeloSingular§§RemoteMysqlDataSourceRepository;

class §§ModeloSingular§§Controller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $data = Response(
            (new §§ModeloSingular§§IndexHandler(
                new §§ModeloSingular§§Service(new §§ModeloSingular§§RemoteMysqlDataSourceRepository())
            )
            )->handle($request)
        );
        return $data;
    }

    public function create(Request $request)
    {
        return view('§§fornecedor§§.§§pacote§§.§§modeloplural§§.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\Store§§ModeloSingular§§Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Store§§ModeloSingular§§Request $request)
    {
        return Response((array)
        (new §§ModeloSingular§§StoreHandler(
            new §§ModeloSingular§§Service(new §§ModeloSingular§§RemoteMysqlDataSourceRepository())
        )
        )->handle($request));
    }

    /**
     * Display the specified resource.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        return Response((array)(new §§ModeloSingular§§ShowHandler(
            new §§ModeloSingular§§Service(
                new §§ModeloSingular§§RemoteMysqlDataSourceRepository()
            )
        )
        )->handle($request));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */

    public function destroy(Request $request)
    {
        return Response((new §§ModeloSingular§§DeleteHandler(
            new §§ModeloSingular§§Service(new §§ModeloSingular§§RemoteMysqlDataSourceRepository())
        ))->handle($request));
    }
}
