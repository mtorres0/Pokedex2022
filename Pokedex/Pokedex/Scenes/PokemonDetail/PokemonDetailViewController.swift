//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created Michel Torres Alonso on 11/06/22.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

final class PokemonDetailViewController: UIViewController, PokemonDetailViewProtocol {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var typesCollectionView: UICollectionView!
    @IBOutlet weak var statsTableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var presenter: PokemonDetailPresenterProtocol?
    
    var collectionViewDataSource: TypesCollectionViewDataSource?
    var collectionViewDelegate: TypesCollectionViewDelegate?
    
    var tableViewDataSource: StatTableViewDataSource?
    
    var pokemonId: Int = 0

	override func viewDidLoad() {
        super.viewDidLoad()
        containerView.layer.cornerRadius = 40
        setupCollectionView()
        setupTableView()
        spinner.startAnimating()
        presenter?.getPokemonInfo(id: pokemonId)
    }
    
    private func setupCollectionView() {
        typesCollectionView.register(UINib(nibName: "PokemonTypeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PokemonTypeCollectionViewCell")
        setupDataSourceAndDelegate()
    }
    
    private func setupDataSourceAndDelegate() {
        collectionViewDataSource = TypesCollectionViewDataSource(types: presenter?.pokemon?.types ?? [])
        collectionViewDelegate = TypesCollectionViewDelegate(delegate: self, types: presenter?.pokemon?.types ?? [])
        typesCollectionView.dataSource = collectionViewDataSource
        typesCollectionView.delegate = collectionViewDelegate
    }
    
    private func setupTableView() {
        statsTableView.register(UINib(nibName: "StatTableViewCell", bundle: nil), forCellReuseIdentifier: "StatTableViewCell")
        setupDataSourceAndDelegate()
    }
    
    private func setupTableViewDataSourceAndDelegate() {
        guard let stats = presenter?.pokemon?.stats else { return }
        tableViewDataSource = StatTableViewDataSource(stats: stats)
        statsTableView.dataSource = tableViewDataSource
    }
    
    func showPokemonInfo() {
        spinner.stopAnimating()
        spinner.isHidden = true
        title = presenter?.pokemon?.name?.capitalized
        nameLabel.text = presenter?.pokemon?.name?.capitalized
        numberLabel.text = String(format: "#%03d", pokemonId)
        pokemonImageView.loadImage(from: URL(string: presenter?.pokemon?.sprites?.frontDefault ?? ""))
        if let type = presenter?.pokemon?.types?.first?.type?.name, let typeColor = TypeColor(rawValue: type) {
            view.backgroundColor = typeColor.color
        }
        setupDataSourceAndDelegate()
        typesCollectionView.reloadData()
        setupTableViewDataSourceAndDelegate()
        statsTableView.reloadData()
    }

    func showErrorMessage() {
        spinner.stopAnimating()
        let alert = UIAlertController(title: "Error", message: "No se pudieron obtener los datos.", preferredStyle: .alert)
        let button = UIAlertAction(title: "Aceptar", style: .cancel) { action in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(button)
        self.present(alert, animated: true, completion: nil)
    }
}

extension PokemonDetailViewController: TypeDelegate {
    func selectPokemonType(_ type: PokemonType) {
        presenter?.goToTypePokemon(type)
    }
}
